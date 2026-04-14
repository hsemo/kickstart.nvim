local M = {}

local function notify(msg, level)
  vim.notify('pack: ' .. msg, level or vim.log.levels.WARN)
end

local function infer_name_from_src(src)
  local clean = src:gsub('%.git$', '')
  return clean:match('[^/]+$')
end

local function normalize_src(src)
  if src:match('^%a[%w+.-]*://') or src:match('^git@') then
    return src
  end
  if src:match('^[%w_.-]+/[%w_.-]+$') then
    return 'https://github.com/' .. src
  end
  return src
end

local function normalize_version(version)
  if type(version) ~= 'string' then
    return version
  end

  local major = version:match('^(%d+)%.%*$')
  if major then
    return vim.version.range(major)
  end

  return version
end

local function is_enabled(spec)
  if spec.enabled == false then
    return false
  end
  if type(spec.enabled) == 'function' then
    local ok, res = pcall(spec.enabled)
    if not ok then
      notify('enabled() failed for ' .. tostring(spec[1]) .. ': ' .. res)
      return false
    end
    if not res then
      return false
    end
  end
  if type(spec.cond) == 'function' then
    local ok, res = pcall(spec.cond)
    if not ok then
      notify('cond() failed for ' .. tostring(spec[1]) .. ': ' .. res)
      return false
    end
    if not res then
      return false
    end
  elseif spec.cond == false then
    return false
  end
  return true
end

local function infer_main(spec)
  if type(spec.main) == 'string' and spec.main ~= '' then
    return spec.main
  end
  local repo = spec[1] or spec.src
  if type(repo) ~= 'string' then
    return nil
  end
  local name = repo:gsub('%.git$', ''):match('[^/]+$') or ''
  name = name:gsub('^nvim%-', '')
  name = name:gsub('%.nvim$', '')
  name = name:gsub('%-nvim$', '')
  return name:gsub('%-', '.')
end

local function apply_keys(spec)
  if type(spec.keys) ~= 'table' then
    return
  end
  for _, key_spec in ipairs(spec.keys) do
    if type(key_spec) == 'table' and type(key_spec[1]) == 'string' then
      local lhs = key_spec[1]
      local rhs = key_spec[2]
      if rhs ~= nil then
        local opts = {}
        opts.desc = key_spec.desc
        opts.silent = key_spec.silent
        opts.expr = key_spec.expr
        opts.nowait = key_spec.nowait
        opts.remap = key_spec.remap
        opts.buffer = key_spec.buffer
        local mode = key_spec.mode or 'n'
        pcall(vim.keymap.set, mode, lhs, rhs, opts)
      end
    end
  end
end

local function resolve_opts(spec)
  local opts = spec.opts
  if type(opts) == 'function' then
    local ok, result = pcall(opts, spec, {})
    if ok then
      return result or {}
    end
    notify('opts() failed for ' .. tostring(spec[1]) .. ': ' .. result)
    return {}
  end
  return opts
end

local function apply_config(spec)
  if type(spec.init) == 'function' then
    local ok, err = pcall(spec.init)
    if not ok then
      notify('init failed for ' .. tostring(spec[1]) .. ': ' .. err)
    end
  end

  apply_keys(spec)

  local opts = resolve_opts(spec)
  if type(spec.config) == 'function' then
    local ok, err = pcall(spec.config, spec, opts)
    if not ok then
      notify('config failed for ' .. tostring(spec[1]) .. ': ' .. err)
    end
    return
  end

  if opts ~= nil then
    local main = infer_main(spec)
    if not main then
      return
    end
    local ok, mod = pcall(require, main)
    if not ok then
      notify('require failed for ' .. main .. ': ' .. mod)
      return
    end
    if type(mod.setup) == 'function' then
      local setup_ok, setup_err = pcall(mod.setup, opts)
      if not setup_ok then
        notify('setup failed for ' .. main .. ': ' .. setup_err)
      end
    end
  end
end

local function collect_specs_from_module(mod_name)
  local ok, loaded = pcall(require, mod_name)
  if not ok then
    notify('failed to require ' .. mod_name .. ': ' .. loaded)
    return {}
  end
  if type(loaded) ~= 'table' then
    return {}
  end

  if type(loaded[1]) == 'string' and loaded[1]:find('/') then
    return { loaded }
  end

  return loaded
end

local function flatten(spec, state)
  if type(spec) == 'string' then
    spec = { spec }
  end
  if type(spec) ~= 'table' then
    return
  end

  if type(spec.dependencies) == 'table' then
    for _, dep in ipairs(spec.dependencies) do
      flatten(dep, state)
    end
  end

  local repo = spec[1] or spec.src
  if type(repo) == 'string' and repo ~= '' then
    if is_enabled(spec) then
      local name = spec.name or infer_name_from_src(repo)
      if not state.by_name[name] then
        state.by_name[name] = true
        state.specs[#state.specs + 1] = spec
      end
    end
  end
end

local function all_custom_modules()
  local modules = {}
  local files = vim.fn.readdir(vim.fn.stdpath('config') .. '/lua/custom/plugins')
  table.sort(files)
  for _, file in ipairs(files) do
    if file:sub(-4) == '.lua' and file ~= 'init.lua' then
      modules[#modules + 1] = 'custom.plugins.' .. file:gsub('%.lua$', '')
    end
  end
  return modules
end

function M.setup()
  local state = { specs = {}, by_name = {} }

  flatten('tpope/vim-fugitive', state)
  flatten('tpope/vim-rhubarb', state)
  flatten('tpope/vim-sleuth', state)

  for _, mod_name in ipairs(all_custom_modules()) do
    local specs = collect_specs_from_module(mod_name)
    for _, spec in ipairs(specs) do
      flatten(spec, state)
    end
  end

  local pack_specs = {}
  for _, spec in ipairs(state.specs) do
    local repo = spec[1] or spec.src
    if type(repo) == 'string' then
      pack_specs[#pack_specs + 1] = {
        src = normalize_src(repo),
        name = spec.name or infer_name_from_src(repo),
        version = normalize_version(spec.version),
        data = { build = spec.build },
      }
    end
  end

  vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
      local build = ev.data and ev.data.spec and ev.data.spec.data and ev.data.spec.data.build
      if type(build) == 'string' and (ev.data.kind == 'install' or ev.data.kind == 'update') then
        vim.system({ 'sh', '-c', build }, { cwd = ev.data.path }, function(res)
          if res.code ~= 0 then
            notify(('build failed for %s: %s'):format(ev.data.spec.name, res.stderr), vim.log.levels.ERROR)
          end
        end)
      end
    end,
  })

  vim.pack.add(pack_specs, { confirm = false, load = true })

  for _, spec in ipairs(state.specs) do
    apply_config(spec)
  end

  vim.api.nvim_create_user_command('PackUpdate', function()
    vim.pack.update()
  end, {})

  vim.api.nvim_create_user_command('PackUpdateForce', function()
    vim.pack.update(nil, { force = true })
  end, {})

  vim.api.nvim_exec_autocmds('User', { pattern = 'VeryLazy' })
end

return M

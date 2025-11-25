-- vim.api.nvim_create_autocmd('FileType', {
-- 	desc = 'Change indent for js,ts,html,jsx,tsx',
--
-- 	pattern = {'javascript', 'typescript', 'html', 'javascriptreact', 'typescriptreact'},
-- 	group = vim.api.nvim_create_augroup('indent_for_js', { clear = true }),
-- 	callback = function (opts)
-- 		-- print('executed autocmd')
-- 		vim.opt.tabstop = 2
-- 		vim.opt.softtabstop = 2
-- 		vim.opt.shiftwidth = 2
-- 	end,
-- })

-- keep cursor centered on most moves
-- vim.api.nvim_create_autocmd({ 'CursorMoved' }, {
-- 	callback = function()
-- 		-- check last key pressed
-- 		vim.cmd 'normal! zz'
-- 		-- local key = vim.fn.getcharstr()
-- 		-- if it's a scroll command, don't force zz
-- 		-- if key ~= '<C-d>' and key ~= '<C-u>' and key ~= '<C-f>' and key ~= '<C-b>' then
-- 		-- end
-- 	end,
-- })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.api.nvim_create_autocmd('QuitPre', {
  desc = 'Save current session if it exists',
  callback = function()
    local session_manager = require 'session_manager'

    if session_manager.current_dir_session_exists() or vim.fn.confirm('Save current session?', '&Yes\n&No') == 1 then
      session_manager.save_current_session()
    end
  end,
})

-- LSP Attach
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    -- print(vim.tbl_keys(event))
    local nmap = function(keys, func, desc)
      if desc then
        desc = 'LSP: ' .. desc
      end

      vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [d]efinition')
    -- nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('gD', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [r]eferences')
    nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
    -- nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>w', '', '[W]orkspace')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- See `:help K` for why this keymap
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- Lesser used LSP functionality
    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')

    -- Create a command `:Format` local to the LSP buffer
    -- vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    --   vim.lsp.buf.format()
    -- end, { desc = 'Format current buffer with LSP' })
  end,
})

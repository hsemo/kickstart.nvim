return {
  root_dir = function(filename, bufnr)
    vim.fs.root(filename, {
      '.luarc.json',
      '.luarc.jsonc',
      '.luacheckrc',
      '.stylua.toml',
      'stylua.toml',
      'selene.toml',
      'selene.yml',
      'init.lua',
      'main.lua',
    })
  end,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      workspace = {
        library = {
          '/usr/local/share/luajit-2.1',
        },
      },
    },
  },
  single_file_support = true,
}

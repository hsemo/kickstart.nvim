return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  lazy = false,
  dependencies = { 'williamboman/mason.nvim' },
  config = function()
    require('mason-tool-installer').setup {
      ensure_installed = {
        'lua-language-server',
        'pyright',
        'tree-sitter-cli',
        'stylua',
        'prettierd',
        'black',
        'isort',
      },
      run_on_start = true,
    }
  end,
}

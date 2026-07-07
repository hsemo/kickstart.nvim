return {
  'pmizio/typescript-tools.nvim',
  ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'neovim/nvim-lspconfig',
  },
  config = function()
    local opts = vim.tbl_deep_extend('force', require('lsp.servers.typescript_tools'), {
      capabilities = require('lsp.capabilities').get(),
    })
    require('typescript-tools').setup(opts)
  end,
}

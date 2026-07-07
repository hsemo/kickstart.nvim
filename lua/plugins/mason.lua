return {
  'williamboman/mason.nvim',
  lazy = false,
  priority = 90,
  config = function()
    require('mason').setup()

    -- Mason-installed CLIs (tree-sitter-cli, formatters, etc.)
    local mason_bin = vim.fn.stdpath('data') .. '/mason/bin'
    vim.env.PATH = mason_bin .. ':' .. (vim.env.PATH or '')
  end,
}

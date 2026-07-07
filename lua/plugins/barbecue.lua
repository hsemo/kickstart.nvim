return {
  'utilyre/barbecue.nvim',
  version = '*',
  event = 'VeryLazy',
  dependencies = {
    {
      'SmiteshP/nvim-navic',
      opts = {
        highlight = true,
        separator = '  ',
        depth_limit = 5,
        safe_output = true,
        lsp = {
          auto_attach = false,
        },
      },
    },
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    attach_navic = false,
    show_dirname = false,
    show_modified = true,
    exclude_filetypes = { 'neo-tree', 'alpha', 'dashboard', 'snacks' },
    theme = {
      normal = { bg = '#282c34', fg = '#abb2bf' },
      ellipsis = { fg = '#5c6370' },
      basename = { fg = '#e5c07b', bold = true },
      context = { fg = '#61afef' },
      context_media = { fg = '#56b6c2' },
    },
  },
}

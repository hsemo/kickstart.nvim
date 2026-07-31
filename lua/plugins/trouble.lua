return {
  'folke/trouble.nvim',
  cmd = 'Trouble',
  opts = {},
  keys = {
    {
      '<leader>xx',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Workspace diagnostics',
    },
    {
      '<leader>xX',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = 'Buffer diagnostics',
    },
    {
      '<leader>cs',
      '<cmd>Trouble symbols toggle<cr>',
      desc = 'Document symbols',
    },
    {
      '<leader>cS',
      '<cmd>Trouble lsp toggle<cr>',
      desc = 'LSP symbols / refs / defs',
    },
    {
      '<leader>xL',
      '<cmd>Trouble loclist toggle<cr>',
      desc = 'Location list',
    },
    {
      '<leader>xQ',
      '<cmd>Trouble qflist toggle<cr>',
      desc = 'Quickfix list',
    },
  },
  specs = {
    'folke/snacks.nvim',
    opts = function(_, opts)
      return vim.tbl_deep_extend('force', opts or {}, {
        picker = {
          actions = require('trouble.sources.snacks').actions,
          win = {
            input = {
              keys = {
                ['<c-t>'] = { 'trouble_open', mode = { 'n', 'i' } },
              },
            },
          },
        },
      })
    end,
  },
}

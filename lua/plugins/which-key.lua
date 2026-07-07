return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    spec = {
      { '<leader>e', group = 'Explorer' },
      { '<leader>f', group = 'Find' },
      { '<leader>s', group = 'Search' },
      { '<leader>b', group = 'Buffer' },
      { '<leader>c', group = 'Code (TS)' },
      { '<leader>l', group = 'Lazy' },
      { '<leader>u', group = 'Toggle' },
      { 'g', group = 'Go to (LSP when attached)' },
      { '[', group = 'Previous' },
      { ']', group = 'Next' },
    },
  },
  keys = {
    {
      '<leader>?',
      function()
        require('which-key').show { global = false }
      end,
      desc = 'Buffer-local keymaps',
    },
    {
      '<leader><leader>?',
      function()
        require('which-key').show { global = true }
      end,
      desc = 'All keymaps',
    },
  },
}

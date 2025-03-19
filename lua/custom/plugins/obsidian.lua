return {
  'epwalsh/obsidian.nvim',
  version = '*',
  lazy = false,
  ft = 'markdown',
  -- event = {
  --   'BufReadPre ' .. vim.fn.expand '~' .. '/Documents/obsidian/arch/*.md',
  --   'BufNewFile ' .. vim.fn.expand '~' .. '/Documents/obsidian/arch/*.md',
  -- },
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',
  },
  opts = {
    workspaces = {
      {
        name = 'personal',
        path = '~/Documents/obsidian/arch',
      },
    },
  },
}

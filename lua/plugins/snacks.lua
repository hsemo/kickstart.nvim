return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    quickfile = { enabled = true },
    picker = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = false },
    dashboard = { enabled = false },
    notifier = { enabled = true, timeout = 3000 },
    input = { enabled = true },
  },
  keys = {
    -- Explorer
    {
      '<leader>e',
      function()
        Snacks.explorer()
      end,
      desc = 'File explorer',
    },
    -- Find (same bindings as the old telescope setup)
    {
      '<leader>ff',
      function()
        Snacks.picker.files()
      end,
      desc = 'Find files',
    },
    {
      '<leader>fg',
      function()
        Snacks.picker.grep()
      end,
      desc = 'Live grep',
    },
    {
      '<leader>fb',
      function()
        Snacks.picker.buffers()
      end,
      desc = 'Find buffers',
    },
    {
      '<leader>fr',
      function()
        Snacks.picker.recent()
      end,
      desc = 'Recent files',
    },
    {
      '<leader>fh',
      function()
        Snacks.picker.help()
      end,
      desc = 'Help tags',
    },
    {
      '<leader>/',
      function()
        Snacks.picker.lines { buffers = { vim.api.nvim_get_current_buf() } }
      end,
      desc = 'Search in current buffer',
    },
    -- Extra useful pickers
    {
      '<leader><space>',
      function()
        Snacks.picker.smart()
      end,
      desc = 'Smart find files',
    },
    {
      '<leader>,',
      function()
        Snacks.picker.buffers()
      end,
      desc = 'Buffers',
    },
    {
      '<leader>sw',
      function()
        Snacks.picker.grep_word()
      end,
      desc = 'Grep word or selection',
      mode = { 'n', 'x' },
    },
    {
      '<leader>sd',
      function()
        Snacks.picker.diagnostics()
      end,
      desc = 'Diagnostics',
    },
    {
      '<leader>sk',
      function()
        Snacks.picker.keymaps()
      end,
      desc = 'Keymaps',
    },
    {
      '<leader>bd',
      function()
        Snacks.bufdelete()
      end,
      desc = 'Delete buffer',
    },
  },
}

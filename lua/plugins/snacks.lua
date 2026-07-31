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
    dashboard = {
      enabled = true,
      sections = {
        { section = 'header' },
        { section = 'keys', gap = 1, padding = 1 },
        { section = 'projects', title = 'Projects', padding = 1, limit = 8 },
        { section = 'recent_files', title = 'Recent Files', padding = 1, limit = 5 },
        { section = 'startup' },
      },
    },
    notifier = { enabled = true, timeout = 3000 },
    input = { enabled = true },
    lazygit = { enabled = true },
    terminal = { enabled = true },
  },
  keys = {
    {
      '<leader>h',
      function()
        Snacks.dashboard()
      end,
      desc = 'Dashboard',
    },
    {
      '<leader>e',
      function()
        Snacks.explorer()
      end,
      desc = 'File explorer',
    },
    {
      '<leader>fp',
      function()
        Snacks.picker.projects()
      end,
      desc = 'Projects',
    },
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
    {
      '<leader>gg',
      function()
        Snacks.lazygit()
      end,
      desc = 'Lazygit',
    },
    {
      '<C-/>',
      function()
        Snacks.terminal()
      end,
      desc = 'Toggle terminal',
    },
    {
      '<C-_>',
      function()
        Snacks.terminal()
      end,
      desc = 'Toggle terminal',
    },
  },
}

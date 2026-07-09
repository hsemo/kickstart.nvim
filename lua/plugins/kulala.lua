return {
  'mistweaverco/kulala.nvim',
  ft = { 'http', 'rest' },
  opts = {
    global_keymaps = false,
  },
  config = function(_, opts)
    require('kulala').setup(opts)

    vim.filetype.add {
      extension = {
        http = 'http',
        rest = 'http',
      },
    }
  end,
  keys = {
    {
      '<leader>Rs',
      function()
        require('kulala').run()
      end,
      desc = 'Send HTTP request',
    },
    {
      '<leader>Ra',
      function()
        require('kulala').run_all()
      end,
      desc = 'Send all HTTP requests',
    },
    {
      '<leader>Rb',
      function()
        require('kulala').scratchpad()
      end,
      desc = 'Open HTTP scratchpad',
    },
    {
      '<leader>Rr',
      function()
        require('kulala').replay()
      end,
      desc = 'Replay last HTTP request',
    },
  },
}

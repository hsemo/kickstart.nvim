return {
  -- Add indentation guides even on blank lines
  'lukas-reineke/indent-blankline.nvim',
  enabled = false,
  -- Enable `lukas-reineke/indent-blankline.nvim`
  -- See `:help ibl`
  main = 'ibl',
  opts = {
    scope = {
      show_start = false,
      show_end = false,
    },
    indent = {
      -- Alternatives:
      --   • left aligned solid
      --     • `▏`
      --     • `▎` (default)
      --     • `▍`
      --     • `▌`
      --     • `▋`
      --     • `▊`
      --     • `▉`
      --     • `█`
      --   • center aligned solid
      --     • `│`
      --     • `┃`
      --   • right aligned solid
      --     • `▕`
      --     • `▐`
      --   • center aligned dashed
      --     • `╎`
      --     • `╏`
      --     • `┆`
      --     • `┇`
      --     • `┊`
      --     • `┋`
      --   • center aligned double
      --     • `║`
      char = '┃',
    },
  },
}

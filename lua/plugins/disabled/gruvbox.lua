return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    require("gruvbox").setup {
      overrides = {
        LineNr = { fg = '#968472', bg = '#3c3836' }
      },
      transparent_mode = true
    }
  end
}

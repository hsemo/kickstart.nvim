return {
  'vladdoster/remember.nvim',
  -- event = "VeryLazy",
  config = function()
    require('remember').setup({
      open_folds = true,
    })
  end
}

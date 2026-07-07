return {
  'navarasu/onedark.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('onedark').setup {
      style = 'deep',
      transparent = false,
      code_style = {
        comments = 'italic',
        keywords = 'bold',
      },
    }
    vim.cmd.colorscheme('onedark')
  end,
}

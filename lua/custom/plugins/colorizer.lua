return {
  'norcalli/nvim-colorizer.lua',
  config = function()
    require('nvim-autopairs').setup({ '*' }, {
      rgb_fn = true,
    })
  end,
}

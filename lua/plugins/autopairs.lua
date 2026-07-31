return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  dependencies = { 'saghen/blink.cmp' },
  config = function()
    require('nvim-autopairs').setup { check_ts = true }
    require('nvim-autopairs.integration.blink').setup()
  end,
}

return {
  dir = "~/nvim-plugins/first-plugin",
  name = "first-plugin",
  -- lazy = true,
  -- keys = {
  --   {"<leader>ff", "<cmd>"}
  -- },
  config = function()
    require("first-plugin").setup()
  end
}

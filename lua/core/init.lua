require('core.options')
require('keymaps')
require('core.autocmds')
require('core.treesitter')

if vim.g.neovide then
  require('core.neovide')
end

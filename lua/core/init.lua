require('core.options')
require('core.diagnostics')
require('keymaps')
require('core.autocmds')
require('core.treesitter')

if vim.g.neovide then
  require('core.neovide')
end

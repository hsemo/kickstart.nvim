vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { import = 'plugins.enabled' },
}, {})

-- loading options
require 'config.options'

-- loading keymaps
require 'config.keymaps'

-- loading autocmds
require 'config.autocmds'

-- loading custom snippets
require 'config.snippets'

-- loading custom commands
require 'config.commands'

-- lsp configs
require 'config.lsp'

-- neovide
require 'config.neovide'

-- diagnostic
require 'config.diagnostics'

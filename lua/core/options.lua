local opt = vim.opt

-- Line numbers: hybrid mode (absolute on cursor line, relative elsewhere)
opt.number = true
opt.relativenumber = true
opt.signcolumn = 'yes'
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.cursorline = true
opt.wrap = false

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.shiftround = true

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

opt.splitbelow = true
opt.splitright = true
opt.confirm = true
opt.updatetime = 250
opt.timeoutlen = 300

opt.termguicolors = true
opt.undofile = true
opt.swapfile = false
opt.backup = false

opt.completeopt = 'menu,menuone,noselect'
opt.showmode = false

opt.grepprg = 'rg --vimgrep'

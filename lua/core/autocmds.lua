local augroup = vim.api.nvim_create_augroup

-- Relative line numbers in normal mode; absolute while typing
augroup('RelativeNumber', { clear = true })
vim.api.nvim_create_autocmd({ 'InsertEnter' }, {
  group = 'RelativeNumber',
  callback = function()
    vim.opt.relativenumber = false
  end,
})
vim.api.nvim_create_autocmd({ 'InsertLeave' }, {
  group = 'RelativeNumber',
  callback = function()
    vim.opt.relativenumber = true
  end,
})

-- Highlight yanked text
augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  group = 'YankHighlight',
  pattern = '*',
  callback = function()
    vim.hl.on_yank { higroup = 'IncSearch', timeout = 150 }
  end,
})

-- Attach buffer-local LSP keymaps
augroup('UserLspConfig', { clear = true })
vim.api.nvim_create_autocmd('LspAttach', {
  group = 'UserLspConfig',
  callback = function(event)
    require('keymaps.lsp').on_attach(event)
  end,
})

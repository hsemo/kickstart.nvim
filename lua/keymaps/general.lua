local map = vim.keymap.set

-- Leader should not move the cursor in normal/visual mode
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Better j/k with wrapped lines
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Clear search highlight
map({ 'i', 'n' }, '<Esc>', '<cmd>noh<cr><Esc>')

-- Save
map({ 'n', 'i', 'v' }, '<C-s>', '<cmd>w<cr>', { desc = 'Save file' })

-- Window navigation
map('n', '<C-h>', '<C-w>h', { desc = 'Window left', remap = true })
map('n', '<C-j>', '<C-w>j', { desc = 'Window down', remap = true })
map('n', '<C-k>', '<C-w>k', { desc = 'Window up', remap = true })
map('n', '<C-l>', '<C-w>l', { desc = 'Window right', remap = true })

-- Resize windows
map('n', '<C-S-h>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease window width' })
map('n', '<C-S-l>', '<cmd>vertical resize +2<cr>', { desc = 'Increase window width' })
map('n', '<C-S-j>', '<cmd>resize -2<cr>', { desc = 'Decrease window height' })
map('n', '<C-S-k>', '<cmd>resize +2<cr>', { desc = 'Increase window height' })

-- Buffers (Snacks.bufdelete via <leader>bd in plugins/snacks.lua)
map('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Previous buffer' })
map('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next buffer' })

-- System clipboard
map({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Yank to system clipboard' })
map('n', '<leader>Y', '"+Y', { desc = 'Yank line to system clipboard' })
map({ 'n', 'v' }, '<leader>p', '"+p', { desc = 'Paste from system clipboard' })
map('n', '<leader>P', '"+P', { desc = 'Paste before from system clipboard' })

-- Stay in visual mode when indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Move lines (macOS Option = Meta)
map('n', '<M-j>', '<cmd>m .+1<cr>==', { desc = 'Move line down' })
map('n', '<M-k>', '<cmd>m .-2<cr>==', { desc = 'Move line up' })
map('v', '<M-j>', ":m '>+1<cr>gv=gv", { desc = 'Move selection down' })
map('v', '<M-k>', ":m '<-2<cr>gv=gv", { desc = 'Move selection up' })

-- Plugin manager
map('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Open Lazy' })

-- Toggle relative line numbers
map('n', '<leader>ul', function()
  vim.opt.relativenumber = not vim.opt.relativenumber
end, { desc = 'Toggle relative line numbers' })

-- Prefix groups (children are defined in plugin specs or keymaps/lsp.lua)
map('n', '<leader>f', '', { desc = 'Find' })
map('n', '<leader>s', '', { desc = 'Search' })

-- [[ Basic Keymaps ]]

local map = vim.keymap.set

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', 'H', ':Lua')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Taken from LazyVim keymaps.lua
-- Move to window using the <ctrl> hjkl keys
-- map('n', '<leader>i', '<C-w>h', { desc = 'Go to left window', remap = true })
-- map('n', '<leader>j', '<C-w>j', { desc = 'Go to lower window', remap = true })
-- map('n', '<leader>k', '<C-w>k', { desc = 'Go to upper window', remap = true })
-- map('n', '<leader>o', '<C-w>l', { desc = 'Go to right window', remap = true })
map('n', '<C-h>', '<C-w>h', { desc = 'Go to left window', remap = true })
map('n', '<C-j>', '<C-w>j', { desc = 'Go to lower window', remap = true })
map('n', '<C-k>', '<C-w>k', { desc = 'Go to upper window', remap = true })
map('n', '<C-l>', '<C-w>l', { desc = 'Go to right window', remap = true })

-- Resize window using <ctrl> arrow keys
map('n', '<C-S-Up>', '<cmd>resize +2<cr>', { desc = 'Increase window height' })
map('n', '<C-S-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease window height' })
map('n', '<C-S-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease window width' })
map('n', '<C-S-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase window width' })
-- Resize window using <ctrl> hjkl keys
map('n', '<C-S-k>', '<cmd>resize +2<cr>', { desc = 'Increase window height' })
map('n', '<C-S-j>', '<cmd>resize -2<cr>', { desc = 'Decrease window height' })
map('n', '<C-S-h>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease window width' })
map('n', '<C-S-l>', '<cmd>vertical resize +2<cr>', { desc = 'Increase window width' })

-- Move Lines
map('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move down' })
map('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move up' })
map('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move down' })
map('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move up' })
map('v', '<A-j>', ":m '>+1<cr>gv=gv", { desc = 'Move down' })
map('v', '<A-k>', ":m '<-2<cr>gv=gv", { desc = 'Move up' })

-- buffers
map('n', '<leader>b', '', { desc = 'Buffers' })
map('n', '<leader>d', '<cmd>bdelete<cr>', { desc = 'Delete Current Buffer' })
map('n', '<C-x>', '<cmd>bdelete<cr>', { desc = 'Delete Current Buffer' })

-- Clear search with <esc>
map({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and clear hlsearch' })

-- save file
map({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })

-- lazy
map('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Lazy' })

-- new file
-- map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

map('n', '<leader>x', '', { desc = 'Quickfix' })
map('n', '<leader>xl', '<cmd>lopen<cr>', { desc = 'Location List' })
map('n', '<leader>xq', '<cmd>copen<cr>', { desc = 'Quickfix List' })

map('n', '[q', vim.cmd.cprev, { desc = 'Previous quickfix' })
map('n', ']q', vim.cmd.cnext, { desc = 'Next quickfix' })

------------------------------------ Colorizer
-- map("n", "<leader>ccc", "<cmd>ColorizerToggle<cr>", { desc = "ColorizerToggle" })
-- map("n", "<leader>cca", "<cmd>ColorizerAttachToBuffer<cr>", { desc = "ColorizerAttachToBuffer" })
-- map("n", "<leader>ccd", "<cmd>ColorizerDetachFromBuffer<cr>", { desc = "ColorizerDetachFromBuffer" })
-- map("n", "<leader>ccr", "<cmd>ColorizerReloadAllBuffers<cr>", { desc = "ColorizerReloadAllBuffers" })

------------------------------------ Session manager folke/persistence
-- restore the session for the current directory
-- vim.api.nvim_set_keymap("n", "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]],
-- 	{ desc = 'Restore the Session for cwd' })

-- restore the last session
-- vim.api.nvim_set_keymap("n", "<leader>ql", [[<cmd>lua require("persistence").load({ last = true })<cr>]],
-- 	{ desc = 'Restore the last session' })

-- stop Persistence => session won't be saved on exit
-- vim.api.nvim_set_keymap("n", "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]], { desc = 'Stop Persistence' })

------------------------------------ Window Manipulation
-- map({ "n", "v" }, "<leader>w", "<C-w>", { desc = "Window" })

map('n', '<leader>ts', ":lua require('onedark').toggle()<cr>", { desc = 'Toggle onedark style' })

-- system clipboard support
map('n', '<leader>y', '"+y', { desc = 'Yank to system clipboard' })
map('v', '<leader>y', '"+y', { desc = 'Yank to system clipboard' })
map('n', '<leader>Y', '"+Y', { desc = 'Yank to system clipboard' })
map('v', '<leader>Y', '"+Y', { desc = 'Yank to system clipboard' })

map('n', '<leader>p', '"+p', { desc = 'Paste from system clipboard' })
map('v', '<leader>p', '"+p', { desc = 'Paste from system clipboard' })
map('n', '<leader>P', '"+P', { desc = 'Paste from system clipboard' })
map('v', '<leader>P', '"+P', { desc = 'Paste from system clipboard' })

-- to differentiate between yank and delete
-- yank to "0 register (default behaviour) and paste from "0 register (custom behaviour)
-- deleted and changed text will go into "- register
-- map("n", "p", '"0p', { desc = "Paste from last yanked register \"0" })
-- map("v", "p", '"0p', { desc = "Paste from last yanked register \"0" })
-- map("n", "P", '"0P', { desc = "Paste from last yanked register \"0" })
-- map("v", "P", '"0P', { desc = "Paste from last yanked register \"0" })
-- map("n", "d", '"0d', { desc = "Cut to yank register \"0" })
-- map("v", "d", '"0d', { desc = "Cut to yank register \"0" })
-- map("n", "c", '"0c', { desc = "and change to yank register \"0" })
-- map("v", "c", '"0c', { desc = "Cut and change to yank register \"0" })

-- from primeagen
map('x', 'p', '"_dP')
map('x', '<C-u>', '<C-u>zz')
map('x', '<C-d>', '<C-d>zz')

-- map({ 'n', 'v' }, '<leader>e', '<cmd>Neotree<cr>', { desc = 'Explorer NeoTree' })
map({ 'n', 'v' }, '<leader>e', '<cmd>Oil<cr>', { desc = 'Edit parent dir' })

-- Session management
map('n', '<leader>f', '', { desc = 'SessionManager' })
map('n', '<leader>ff', '<cmd>SessionManager load_session<cr>', { desc = 'Load session' })
map('n', '<leader>fd', '<cmd>SessionManager load_current_dir_session<cr>', { desc = 'Load dir session' })
map('n', '<leader>fg', '<cmd>SessionManager load_git_session<cr>', { desc = 'Load git session' })
map('n', '<leader>fl', '<cmd>SessionManager load_last_session<cr>', { desc = 'Load last session' })

-- remove ^ from package.json
map('n', '<leader>z', '<cmd>%s/\\^//g<cr>', { desc = 'Remove ^ from `package.json`' })

-- custom lsp keybindings
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', { desc = 'Go to definition' })

-- Neogit
map('n', '<leader>ng', '<cmd>Neogit<cr>', { desc = 'Neogit' })

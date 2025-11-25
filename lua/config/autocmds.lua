-- vim.api.nvim_create_autocmd('FileType', {
-- 	desc = 'Change indent for js,ts,html,jsx,tsx',
--
-- 	pattern = {'javascript', 'typescript', 'html', 'javascriptreact', 'typescriptreact'},
-- 	group = vim.api.nvim_create_augroup('indent_for_js', { clear = true }),
-- 	callback = function (opts)
-- 		-- print('executed autocmd')
-- 		vim.opt.tabstop = 2
-- 		vim.opt.softtabstop = 2
-- 		vim.opt.shiftwidth = 2
-- 	end,
-- })

-- keep cursor centered on most moves
-- vim.api.nvim_create_autocmd({ 'CursorMoved' }, {
-- 	callback = function()
-- 		-- check last key pressed
-- 		vim.cmd 'normal! zz'
-- 		-- local key = vim.fn.getcharstr()
-- 		-- if it's a scroll command, don't force zz
-- 		-- if key ~= '<C-d>' and key ~= '<C-u>' and key ~= '<C-f>' and key ~= '<C-b>' then
-- 		-- end
-- 	end,
-- })

vim.api.nvim_create_autocmd('QuitPre', {
  desc = 'Save current session if it exists',
  callback = function()
    local session_manager = require 'session_manager'

    if session_manager.current_dir_session_exists() or vim.fn.confirm('Save current session?', '&Yes\n&No') == 1 then
      session_manager.save_current_session()
    end
  end,
})

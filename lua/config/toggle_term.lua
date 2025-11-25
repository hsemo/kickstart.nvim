-- Toggleable floating terminal using nvim_set_option_value (Neovim ≥0.9)
local float_term = { buf = nil, win = nil, job = nil }

local function open_term()
	-- (Re)create buffer if needed
	if not (float_term.buf and vim.api.nvim_buf_is_valid(float_term.buf)) then
		float_term.buf = vim.api.nvim_create_buf(false, true) -- scratch, listed=false
		-- buffer options (new API)
		vim.api.nvim_set_option_value('bufhidden', 'hide', { buf = float_term.buf })

		-- Start terminal in that buffer
		vim.api.nvim_buf_call(float_term.buf, function()
			float_term.job = vim.fn.termopen(vim.o.shell)
		end)
	end

	-- Size & position
	local ui = vim.api.nvim_list_uis()[1]
	local width = math.floor(ui.width * 0.8)
	local height = math.floor(ui.height * 0.8)
	local row = math.floor((ui.height - height) / 2)
	local col = math.floor((ui.width - width) / 2)

	-- Open floating window
	float_term.win = vim.api.nvim_open_win(float_term.buf, true, {
		relative = 'editor',
		width = width,
		height = height,
		row = row,
		col = col,
		style = 'minimal',
		border = 'rounded',
	})

	-- window options (new API)
	-- Example: slight transparency; remove if you don’t want it
	-- pcall(vim.api.nvim_set_option_value, 'winblend', 10, { win = float_term.win })

	vim.cmd 'startinsert'
end

function ToggleFloatingTerminal()
	if float_term.win and vim.api.nvim_win_is_valid(float_term.win) then
		vim.api.nvim_win_close(float_term.win, true)
		float_term.win = nil
	else
		open_term()
	end
end

-- Keymaps: toggle from Normal or Terminal mode
vim.keymap.set({ 'n', 't' }, '<C-t>', ToggleFloatingTerminal, { silent = true })

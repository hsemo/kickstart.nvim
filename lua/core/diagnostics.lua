vim.diagnostic.config {
  virtual_text = {
    prefix = '●',
    spacing = 2,
  },
  float = {
    border = 'rounded',
    source = true,
    header = '',
    prefix = '',
  },
  signs = true,
  update_in_insert = false,
  severity_sort = true,
}

-- Show diagnostic details when the cursor rests on a warning/error
local group = vim.api.nvim_create_augroup('DiagnosticHover', { clear = true })
vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
  group = group,
  callback = function()
    if vim.bo.buftype ~= '' or vim.bo.filetype == '' then
      return
    end
    vim.diagnostic.open_float(nil, {
      focus = false,
      scope = 'cursor',
      border = 'rounded',
    })
  end,
})

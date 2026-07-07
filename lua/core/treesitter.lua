local augroup = vim.api.nvim_create_augroup

-- Treesitter highlighting + indent (nvim-treesitter main branch API)
augroup('Treesitter', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = 'Treesitter',
  callback = function()
    if pcall(vim.treesitter.start) then
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})

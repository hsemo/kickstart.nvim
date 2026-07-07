local parsers = {
  'bash',
  'css',
  'html',
  'javascript',
  'json',
  'lua',
  'markdown',
  'python',
  'tsx',
  'typescript',
  'vim',
  'yaml',
}

local function install_parsers()
  if vim.fn.executable('tree-sitter') ~= 1 then
    return false
  end
  require('nvim-treesitter').install(parsers)
  return true
end

return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  dependencies = {
    'williamboman/mason.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').setup {
      install_dir = vim.fn.stdpath('data') .. '/site',
    }

    if not install_parsers() then
      -- tree-sitter-cli may still be installing via Mason on first launch
      vim.api.nvim_create_autocmd('User', {
        pattern = 'MasonToolsInstallCompleted',
        callback = function()
          install_parsers()
        end,
      })
      vim.defer_fn(install_parsers, 3000)
    end
  end,
}

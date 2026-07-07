local function load_server_config(name)
  local ok, config = pcall(require, 'lsp.servers.' .. name)
  if ok then
    return config
  end
  return {}
end

-- ts_ls is intentionally omitted — typescript-tools.nvim handles JS/TS/React
local servers = { 'lua_ls', 'pyright' }

return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
    'saghen/blink.cmp',
  },
  config = function()
    -- Prevent mason from auto-starting ts_ls alongside typescript-tools
    vim.lsp.enable('ts_ls', false)

    local capabilities = require('lsp.capabilities').get()
    local lspconfig = require('lspconfig')

    require('mason-lspconfig').setup {
      ensure_installed = servers,
      automatic_enable = {
        exclude = { 'ts_ls' },
      },
      handlers = {
        function(server_name)
          lspconfig[server_name].setup(vim.tbl_extend('force', {
            capabilities = capabilities,
          }, load_server_config(server_name)))
        end,
      },
    }
  end,
}

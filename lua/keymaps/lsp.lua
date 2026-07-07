local M = {}

--- Buffer-local LSP keymaps. Called from core/autocmds.lua on LspAttach.
function M.on_attach(event)
  local buf = event.buf
  local client = vim.lsp.get_client_by_id(event.data.client_id)
  local map = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { buffer = buf, desc = 'LSP: ' .. desc })
  end

  map('gd', vim.lsp.buf.definition, 'Go to definition')
  map('gD', vim.lsp.buf.declaration, 'Go to declaration')
  map('gr', vim.lsp.buf.references, 'Go to references')
  map('gi', vim.lsp.buf.implementation, 'Go to implementation')
  map('gt', vim.lsp.buf.type_definition, 'Go to type definition')
  map('K', vim.lsp.buf.hover, 'Hover documentation')
  map('<leader>rn', vim.lsp.buf.rename, 'Rename symbol')
  map('<leader>ca', vim.lsp.buf.code_action, 'Code action')

  map('[d', function()
    vim.diagnostic.jump { count = -1 }
  end, 'Previous diagnostic')
  map(']d', function()
    vim.diagnostic.jump { count = 1 }
  end, 'Next diagnostic')
  map('<leader>e', vim.diagnostic.open_float, 'Show diagnostic float')

  -- Winbar breadcrumbs (barbecue.nvim + nvim-navic)
  if client and client:supports_method('textDocument/documentSymbol') then
    require('nvim-navic').attach(client, buf)
  end

  -- typescript-tools.nvim extras (TSTools* user commands)
  if client and client.name == 'typescript-tools' then
    map('<leader>co', '<cmd>TSToolsOrganizeImports<cr>', 'Organize imports')
    map('<leader>cu', '<cmd>TSToolsRemoveUnusedImports<cr>', 'Remove unused imports')
    map('<leader>cf', '<cmd>TSToolsFixAll<cr>', 'Fix all fixable issues')
  end
end

return M

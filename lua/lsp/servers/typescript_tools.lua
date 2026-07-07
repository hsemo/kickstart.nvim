--- Settings for pmizio/typescript-tools.nvim (JS, TS, JSX, TSX).
--- Replaces ts_ls / typescript-language-server — talks to tsserver directly.
return {
  on_attach = function(client, _bufnr)
    -- conform.nvim handles formatting
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
  settings = {
    separate_diagnostic_server = true,
    publish_diagnostic_on = 'insert_leave',
    expose_as_code_action = {
      'add_missing_imports',
      'remove_unused',
      'remove_unused_imports',
      'organize_imports',
      'fix_all',
    },
    tsserver_file_preferences = {
      includeInlayParameterNameHints = 'all',
      includeInlayFunctionParameterTypeHints = true,
      includeInlayVariableTypeHints = true,
      includeCompletionsForModuleExports = true,
      quotePreference = 'auto',
    },
  },
}

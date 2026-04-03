return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local conform = require 'conform'

    conform.setup {
      formatters_by_ft = {
        javascript = { 'prettierd' },
        typescript = { 'prettierd' },
        javascriptreact = { 'prettierd' },
        typescriptreact = { 'prettierd' },
        css = { 'prettierd' },
        html = { 'prettierd' },
        json = { 'prettierd' },
        yaml = { 'prettierd' },
        c = { 'clang_format' },
        cpp = { 'clang_format' },
        markdown = { 'prettierd' },
        -- dart = { 'dart_format' },
        lua = { 'stylua' },
        python = { 'black' },
        -- kotlin = { 'ktfmt' },
      },
      formatters = {
        ktfmt = {
          command = 'ktfmt',
          -- args = {}
          timeout_ms = 1000,
          lsp_format = 'only_after_conform',
        },
      },
      format_on_save = {
        lsp_fallback = true,
        -- async = false,
        -- timeout_ms = 500,
      },
    }

    vim.keymap.set({ 'n', 'v' }, '<leader>mp', function()
      conform.format {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      }
    end, { desc = 'Format file or range (in visual mode)' })
  end,
}

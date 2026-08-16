return {
  'lewis6991/hover.nvim',
  lazy = false,
  config = function()
    require('hover').config {
      --- List of modules names to load as providers.
      --- @type (string|Hover.Config.Provider)[]
      providers = {
        'hover.providers.diagnostic',
        'hover.providers.lsp',
        'hover.providers.dap',
        'hover.providers.man',
        'hover.providers.dictionary',
        -- Optional, disabled by default:
        -- 'hover.providers.gh',
        -- 'hover.providers.gh_user',
        -- 'hover.providers.jira',
        -- 'hover.providers.fold_preview',
        -- 'hover.providers.highlight',
      },
      preview_opts = {
        border = 'single',
      },
      -- Whether the contents of a currently open hover window should be moved
      -- to a :h preview-window when pressing the hover keymap.
      preview_window = false,
      title = true,
    }

    -- Setup keymaps
    vim.keymap.set('n', 'K', function()
      local bufnr = vim.api.nvim_get_current_buf()
      local hover_win = vim.b[bufnr].hover_preview

      if hover_win and vim.api.nvim_win_is_valid(hover_win) then
        -- hover window is open, enter it
        require('hover').enter()
      end

      require('hover').open()
    end, { desc = 'hover.nvim (open)', remap = true })

    vim.keymap.set('n', '<C-p>', function()
      require('hover').switch 'previous'
    end, { desc = 'hover.nvim (previous source)' })

    vim.keymap.set('n', '<C-n>', function()
      require('hover').switch 'next'
    end, { desc = 'hover.nvim (next source)' })
  end,
}

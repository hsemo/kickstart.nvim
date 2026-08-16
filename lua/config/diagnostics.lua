vim.diagnostic.config {
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = 'E', -- or other icon of your choice here, this is just what my config has:
      [vim.diagnostic.severity.WARN] = 'W',
      [vim.diagnostic.severity.INFO] = 'I',
      [vim.diagnostic.severity.HINT] = 'H',
    },
  },
}

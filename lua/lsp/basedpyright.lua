return {
  settings = {
    basedpyright = {
      analysis = {
        typeCheckingMode = 'recommended',
        diagnosticMode = 'openFilesOnly',

        inlayHints = {
          variableTypes = true,
          functionReturnTypes = true,
          callArgumentNames = true,
          genericTypes = true,
        },
      },
    },
  },
}

return {
  tsserver = function(_, opts)
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    require("typescript").setup {
      server = opts,
    }

    return {
      capabilities = capabilities,
    }
  end,
}

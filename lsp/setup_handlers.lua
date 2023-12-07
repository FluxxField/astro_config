local capabilities = require("cmp_nvim_lsp").default_capabilities()

return {
  tsserver = function(_, opts)
    require("typescript").setup {
      server = opts,
    }

    return {
      capabilities = capabilities,
    }
  end,
  rust_analyzer = function(_, opts)
    require("rust-tools").setup {
      server = opts,
    }

    return {
      capabilities = capabilities,
    }
  end,
}

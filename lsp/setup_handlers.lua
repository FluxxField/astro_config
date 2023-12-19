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
      handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
          virtual_text = false,
        }),
      },
    }
  end,
  cssls = function()
    return {
      settings = {
        css = {
          validate = true,
          lint = {
            unknownAtRules = "ignore",
          },
        },
        less = {
          validate = true,
          lint = {
            unknownAtRules = "ignore",
          },
        },
        scss = {
          validate = true,
          lint = {
            unknownAtRules = "ignore",
          },
        },
      },
    }
  end,
}

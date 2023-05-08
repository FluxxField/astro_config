-- https://github.com/jose-elias-alvarez/null-ls.nvim
return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, opts)
    local null_ls = require "null-ls"
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    config.sources = {
      null_ls.builtins.code_actions.eslint_d,
      null_ls.builtins.diagnostics.eslint_d,
      null_ls.builtins.diagnostics.stylelint,
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettierd,
      null_ls.builtins.formatting.eslint_d,
      null_ls.builtins.formatting.fixjson,
      null_ls.builtins.formatting.gofmt,
    }

    opts.on_attach = function(client, bufnr)
      if client.server_capabilities.document_formatting then
        local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = true })

        vim.api.nvim_clear_autocmds { group = group, buffer = bufnr }
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = group,
          desc = "Auto format before save",
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format {
              bufnr = bufnr,
              timeout_ms = 1500,
              filter = function(localClient) return localClient.name ~= "tsserver" end,
            }
          end,
        })
      end
    end

    return opts
  end,
}

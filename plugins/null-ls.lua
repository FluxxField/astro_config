-- https://github.com/jose-elias-alvarez/null-ls.nvim
return {
  "jose-elias-alvarez/null-ls.nvim",
  config = function(_, opts)
    local null_ls = require "null-ls"
    local formatting = null_ls.builtins.formatting

    opts.default_timeout = 10000

    opts.sources = {
      formatting.eslint_d,
      formatting.stylelint,
      formatting.stylua,
      formatting.prettierd,
    }

    opts.on_attach = function(client, bufnr)
      require("astronvim.utils.lsp").on_attach(client, bufnr)

      if client.server_capabilities.document_formatting then
        local group = "format_on_save"

        vim.api.nvim_create_augroup(group, { clear = true })

        vim.api.nvim_create_autocmd("BufWritePre", {
          group = group,
          desc = "Auto format before save",
          event = "fomat_on_save",
          pattern = { "<buffer>" },
          callback = function()
            vim.lsp.buf.format {
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

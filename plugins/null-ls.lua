-- https://github.com/jose-elias-alvarez/null-ls.nvim
return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function(_, config)
    local null_ls = require "null-ls"
    local formatting = null_ls.builtins.formatting

    config.sources = {
      formatting.eslint_d,
      formatting.stylelint,
      formatting.stylua,
      formatting.prettierd,
      formatting.fixjson,
      formatting.gofmt,
    }

    config.on_attach = function(client)
      if client.server_capabilities.document_formatting then
        vim.api.nvim_create_augroup("format_on_save", { clear = true })

        vim.api.nvim_create_augroup("BufWritePre", {
          desc = "Auto format before save",
          event = "format_on_save",
          pattern = { "<buffer>" },
          callback = function() vim.lsp.buf.formatting_sync { async = true, timeout_ms = 10000 } end,
        })
      end
    end

    return config
  end,
  opts = function(_, opts)
    return require("astronvim.utils").extend_tbl(opts, {
      defualt_timeout = 10000,
    })
  end,
}

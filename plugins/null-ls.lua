return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

    config.sources = {
      -- Set a formatter
      null_ls.builtins.code_actions.eslint_d,
      null_ls.builtins.diagnostic.eslint_d,
      null_ls.builtins.diagnostic.jshint,
      null_ls.builtins.diagnostics.stylelint,
      null_ls.builtins.diagnostics.tsc,
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettierd,
      null_ls.builtins.formatting.codespell,
      null_ls.builtins.formatting.eslint_d,
      null_ls.builtins.formatting.fixjson,
      null_ls.builtins.formatting.gofmt,
    }

    return config -- return final config table
  end,
}

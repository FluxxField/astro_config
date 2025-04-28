---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre" },
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  opts = function(_, opts)
    -- opts variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"
    local diagnostics = null_ls.builtins.diagnostics
    local completion = null_ls.builtins.completion

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

    -- Only insert new sources, do not replace the existing ones
    -- (If you wish to replace, use `opts.sources = {}` instead of the `list_insert_unique` function)
    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      -- UX/Code Quality
      diagnostics.trail_space.with {
        disabled_filetypes = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
        },
      },
      diagnostics.codespell,
      diagnostics.stylelint,
      diagnostics.gitlint,
      diagnostics.commitlint,
      completion.spell,
      completion.tags,
    })
  end,
}

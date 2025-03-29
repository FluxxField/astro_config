---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  opts = function(_, opts)
    -- opts variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"
    local diagnostics = null_ls.builtins.diagnostics
    local formatting = null_ls.builtins.formatting
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
      diagnostics.proselint.with {
        disabled_filetypes = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
        },
      },
      diagnostics.codespell,
      formatting.cbfmt,

      -- Web/React/TS
      formatting.rustywind,
      formatting.prettierd,
      require("none-ls.diagnostics.eslint_d").with {
        diagnostics_format = "[#{c}] #{m} (#{s})",
        filter = function(d)
          local ignored_codes = {
            ["prettier/prettier"] = true,
            ["no-mixed-spaces-and-tabs"] = true,
            ["no-trailing-spaces"] = true,
            ["eol-last"] = true,
            ["semi"] = true,
            ["quotes"] = true,
            ["comma-dangle"] = true,
          }

          local code = tostring(d.code)
          return not ignored_codes[code]
        end,
      },
      require "none-ls.formatting.eslint_d",

      -- CSS/SCSS
      diagnostics.stylelint,

      -- Lua
      formatting.stylua,

      -- Git
      diagnostics.gitlint,
      diagnostics.commitlint,

      -- Better Completion
      completion.spell,
      completion.tags,
    })
  end,
}

-- https://github.com/jay-babu/mason-null-ls.nvim

return {
  "jay-babu/mason-null-ls.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "nvimtools/none-ls.nvim",
  },
  event = { "User AstroFile" },
  cond = function() return require("user/customize").mason_null_ls end,
  config = function(...) require "plugins.configs.mason-null-ls"(...) end,
  opts = function(_, opts)
    local null_ls = require "null-ls"
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    return require("astronvim.utils").extend_tbl(opts, {
      ensure_installed = {
        "prettierd",
        "stylua",
        "eslint_d",
        -- "codespell",
        -- "sqlfluff",
      },
      handlers = {
        prettierd = function()
          null_ls.register(formatting.prettierd.with {
            condition = function(utils)
              return utils.root_has_file "package.json"
                or utils.root_has_file ".prettierrc"
                or utils.root_has_file ".prettierrc.json"
                or utils.root_has_file ".prettierrc.yaml"
                or utils.root_has_file ".prettierrc.yml"
                or utils.root_has_file ".prettierrc.toml"
                or utils.root_has_file ".prettierrc.js"
            end,
          })
        end,
        eslint_d = function()
          null_ls.register(diagnostics.eslint_d.with {
            condition = function(utils)
              return utils.root_has_file "package.json"
                or utils.root_has_file ".eslintrc"
                or utils.root_has_file ".eslintrc.json"
                or utils.root_has_file ".eslintrc.yaml"
                or utils.root_has_file ".eslintrc.yml"
                or utils.root_has_file ".eslintrc.toml"
                or utils.root_has_file ".eslintrc.js"
            end,
          })
        end,
      },
    })
  end,
}

-- https://github.com/jay-babu/mason-null-ls.nvim

return {
  "jay-babu/mason-null-ls.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "jose-elias-alvarez/null-ls.nvim",
  },
  event = { "User AstroFile" },
  config = function(...) require "plugins.configs.mason-null-ls"(...) end,
  opts = function(_, opts)
    return require("astronvim.utils").extend_tbl(opts, {
      ensure_installed = {
        "prettierd",
        "stylua",
        "eslint_d",
        "codespell",
        "sqlfluff",
      },
    })
  end,
}

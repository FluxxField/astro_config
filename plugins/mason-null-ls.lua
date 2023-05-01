-- https://github.com/jay-babu/mason-null-ls.nvim
return {
  "jay-babu/mason-null-ls.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "jose-elias-alvarez/null-ls.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function(_, opts) require("mason-null-ls").setup(opts) end,
  opts = {
    ensure_installed = { "prettierd", "stylua", "eslint_d" },
  },
}

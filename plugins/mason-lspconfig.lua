-- https://github.com/williamboman/mason-lspconfig.nvim
return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function(_, opts) require("mason-lspconfig").setup(opts) end,
  opts = {
    ensure_installed = { "lua_ls", "html", "cssls", "jsonls", "tsserver", "sqlls" },
  },
}

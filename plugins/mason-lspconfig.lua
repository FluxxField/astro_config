-- https://github.com/williamboman/mason-lspconfig.nvim

return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function(...) require "plugins.configs.mason-lspconfig"(...) end,
  opts = function(_, opts)
    return require("astronvim.utils").extend_tbl(opts, {
      ensure_installed = {
        "lua_ls",
        "html",
        "cssls",
        "jsonls",
        "tsserver",
        "sqlls",
      },
    })
  end,
}

-- https://github.com/jay-babu/mason-nvim-dap.nvim

return {
  "jay-babu/mason-nvim-dap.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function(...) require "plugins.configs.mason-nvim-dap"(...) end,
  opts = {
    ensure_installed = {
      "bash",
      "js",
    },
  },
}

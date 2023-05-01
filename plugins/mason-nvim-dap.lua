-- https://github.com/jay-babu/mason-nvim-dap.nvim
return {
  "jay-babu/mason-nvim-dap.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function(_, opts) require("mason-nvim-dap").setup(opts) end,
  opts = {
    ensure_installed = { "bash", "js" },
  },
}

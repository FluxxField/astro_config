-- https://github.com/jay-babu/mason-nvim-dap.nvim

return {
  "jay-babu/mason-nvim-dap.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    ensure_installed = {
      "bash",
      "js",
    }
  }
}

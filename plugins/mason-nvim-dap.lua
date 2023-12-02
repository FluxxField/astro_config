-- https://github.com/jay-babu/mason-nvim-dap.nvim

return {
  "jay-babu/mason-nvim-dap.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "nvim-dap",
  },
  cmd = { "DapInstall", "DapUninstall" },
  cond = function() return require("customize").mason_nvim_dap end,
  config = function(...) require "plugins.configs.mason-nvim-dap"(...) end,
  opts = function(_, opts)
    return require("astronvim.utils").extend_tbl(opts, {
      ensure_installed = {
        "bash",
        "js",
      },
    })
  end,
}

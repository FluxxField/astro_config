return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "Oil" },
  cond = function() return require("customize").oil end,
  config = function(_, opts) require("oil").setup(opts) end,
  opts = {},
}

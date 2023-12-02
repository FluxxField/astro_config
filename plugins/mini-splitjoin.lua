return {
  "echasnovski/mini.splitjoin",
  version = "*",
  event = "VeryLazy",
  config = function(_, opts) require("mini.splitjoin").setup(opts) end,
  opts = {},
}

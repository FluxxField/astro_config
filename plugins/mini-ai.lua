-- https://github.com/echasnovski/mini.ai

return {
  "echasnovski/mini.ai",
  version = "*",
  event = "VeryLazy",
  config = function(_, opts) require("mini.ai").setup(opts) end,
  opts = {},
}

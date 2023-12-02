-- https://github.com/echasnovski/mini.ai

return {
  "echasnovski/mini.ai",
  version = "*",
  event = "VeryLazy",
  cond = function() return require("customize").mini_ai end,
  config = function(_, opts) require("mini.ai").setup(opts) end,
  opts = {},
}

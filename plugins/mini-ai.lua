-- https://github.com/echasnovski/mini.ai

return {
  "echasnovski/mini.ai",
  version = "*",
  config = function(_, opts) require("mini.ai").setup(opts) end,
  opts = {},
}

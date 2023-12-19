-- https://github.com/zbirenbaum/copilot.lua
-- https://github.com/zbirenbaum/copilot-cmp

return {
  "zbirenbaum/copilot.lua",
  dependencies = {
    "zbirenbaum/copilot-cmp",
    cond = function() return require("user/customize").copilot_cmp end,
    config = function(_, opts) require("copilot_cmp").setup(opts) end,
    opts = {},
  },
  cond = function() return require("user/customize").copilot end,
  cmd = "Copilot",
  event = "InsertEnter",
  config = function(_, opts) require("copilot").setup(opts) end,
  opts = {},
}

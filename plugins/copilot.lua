-- https://github.com/zbirenbaum/copilot.lua
-- https://github.com/zbirenbaum/copilot-cmp
return {
  "zbirenbaum/copilot.lua",
  dependencies = {
    "zbirenbaum/copilot-cmp",
    config = function(_, opts) require("copilot_cmp").setup(opts) end,
  },
  cmd = "Copilot",
  event = "InsertEnter",
  config = function(_, opts) require("copilot").setup(opts) end,
  opts = {
    suggestion = {
      enabled = false,
    },
    panel = { enabled = false },
  },
}

-- https://github.com/zbirenbaum/copilot.lua
-- Copilot Plugin for Neovim
return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function(_, opts) require("copilot").setup(opts) end,
  opts = {
    suggestion = {
      auto_trigger = true,
      debounce = 50,
      keymap = {
        accept = "<Tab>",
        next = "<C-n>",
        prev = "<C-p>",
      },
    },
  },
}

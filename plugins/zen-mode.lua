-- https://github.com/folke/zen-mode.nvim
return {
  "folke/zen-mode.nvim",
  event = "BufWinEnter",
  cmd = { "ZenMode" },
  config = function(_, opts) require("zen-mode").setup(opts) end,
  opts = {},
}

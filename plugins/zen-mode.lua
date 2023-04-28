-- https://github.com/folke/zen-mode.nvim
return {
  "folke/zen-mode.nvim",
  event = "BufWinEnter",
  cmd = { "ZenMode" },
  config = function() require("zen-mode").setup() end,
}

-- https://github.com/folke/zen-mode.nvim

return {
  "folke/zen-mode.nvim",
  cmd = { "ZenMode" },
  config = function(_, opts) require("zen-mode").setup(opts) end,
  opts = {},
}

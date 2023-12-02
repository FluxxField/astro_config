-- https://github.com/folke/zen-mode.nvim

return {
  "folke/zen-mode.nvim",
  cmd = { "ZenMode" },
  cond = function() return require("customize").zen_mode end,
  config = function(_, opts) require("zen-mode").setup(opts) end,
  opts = {},
}

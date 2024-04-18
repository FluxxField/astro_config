-- https://github.com/folke/tokyonight.nvim
-- https://github.com/rebelot/kanagawa.nvim
-- https://github.com/akai54/2077.nvim
-- https://github.com/thedenisnikulin/vim-cyberpunk

return {
  {
    "folke/tokyonight.nvim",
    cond = function() return require("user/customize").tokyonight end,
    config = function(_, opts) require("tokyonight").setup(opts) end,
    opts = {
      style = "storm",
    },
    lazy = false,
  },
  {
    "rebelot/kanagawa.nvim",
    cond = function() return require("user/customize").kanagawa end,
    config = function(_, opts) require("kanagawa").setup(opts) end,
    opts = {},
    lazy = false,
  },
  {
    "loctvl842/monokai-pro.nvim",
    cond = function() return require("user/customize").monokai_pro end,
    config = function(_, opts) require("monokai-pro").setup(opts) end,
    opts = {},
    lazy = false,
  },
  {
    "akai54/2077.nvim",
    cond = function() return require("user/customize")["2077"] end,
    lazy = false,
  },
  {
    "thedenisnikulin/vim-cyberpunk",
    cond = function() return require("user/customize").vim_cyberpunk end,
    lazy = false,
  },
  {
    "catppuccin/nvim",
    cond = function() return require("user/customize").catppuccino end,
    name = "catppuccin",
    lazy = false,
  },
  {
    "navarasu/onedark.nvim",
    cond = function() return require("user/customize").onedark end,
    name = "onedark",
    lazy = false,
  },
  {
    "ellisonleao/gruvbox.nvim",
    cond = function() return require("user/customize").gruvbox end,
    name = "gruvbox",
    lazy = false,
  },
  {
    "phha/zenburn.nvim",
    cond = function() return require("user/customize").zenburn end,
    name = "zenburn",
    lazy = false,
  },
}

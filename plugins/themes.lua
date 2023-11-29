-- https://github.com/folke/tokyonight.nvim
-- https://github.com/rebelot/kanagawa.nvim
-- https://github.com/akai54/2077.nvim
-- https://github.com/thedenisnikulin/vim-cyberpunk

return {
  {
    "folke/tokyonight.nvim",
    config = function(_, opts) require("tokyonight").setup(opts) end,
    opts = {
      style = "storm",
    },
  },
  {
    "rebelot/kanagawa.nvim",
    config = function(_, opts) require("kanagawa").setup(opts) end,
    opts = {},
  },
  {
    "loctvl842/monokai-pro.nvim",
    config = function(_, opts) require("monokai-pro").setup(opts) end,
    opts = {},
  },
  {
    "akai54/2077.nvim",
  },
  {
    "thedenisnikulin/vim-cyberpunk",
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
  },
  {
    "navarasu/onedark.nvim",
    name = "onedark",
    lazy = false,
  },
}

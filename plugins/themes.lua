-- https://github.com/folke/tokyonight.nvim
-- https://github.com/rebelot/kanagawa.nvim
-- https://github.com/akai54/2077.nvim
-- https://github.com/thedenisnikulin/vim-cyberpunk
return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    config = function(_, opts) require("tokyonight").setup(opts) end,
    opts = {
      style = "storm",
    },
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    config = function(_, opts) require("kanagawa").setup(opts) end,
  },
  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    config = function(_, opts) require("monokai-pro").setup(opts) end,
  },
  {
    "akai54/2077.nvim",
    lazy = false,
  },
  {
    "thedenisnikulin/vim-cyberpunk",
    lazy = false,
  },
}

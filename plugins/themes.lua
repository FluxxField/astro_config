return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    config = function(_, opts) require("tokyonight").setup(opts) end,
    opts = {
      style = "storm",
    },
  },
  -- {
  --   "akai54/2077.nvim",
  --   lazy = false,
  --   config = function(_, opts) require("2077").setup(opts) end,
  --   opts = {},
  -- },
  -- {
  --   "thedenisnikulin/vim-cyberpunk",
  --   lazy = false,
  --   config = function(_, opts) require("vim-cyberpunk").setup(opts) end,
  --   opts = {},
  -- },
}

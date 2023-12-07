return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  branch = "harpoon2",
  event = "VeryLazy",
  cond = function() return require("user/customize").harpoon end,
  config = function(_, opts) require("harpoon"):setup(opts) end,
  opts = {},
}

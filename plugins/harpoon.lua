return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = "VeryLazy",
  cond = function() return require("customize").harpoon end,
}

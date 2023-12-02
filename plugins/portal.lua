-- https://gitbub.com/cbochs/portal.nvim
-- https://gitbub.com/cbochs/grapple.nvim
-- https://gitbub.com/ThePrimeagen/harpoon.nvim

return {
  "cbochs/portal.nvim",
  dependencies = {
    "cbochs/grapple.nvim",
    "ThePrimeagen/harpoon",
  },
  event = "VeryLazy",
  cond = function() return require("customize").portal end,
  config = function(_, opts) require("portal").setup(opts) end,
  opts = {},
}

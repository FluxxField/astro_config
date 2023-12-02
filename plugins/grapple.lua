return {
  "cbochs/grapple.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  cond = function() return require("customize").grapple end,
}

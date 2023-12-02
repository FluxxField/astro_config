return {
  "kevinhwang91/nvim-bqf",
  dependiencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  cond = function() return require("customize").bqf end,
  config = function(_, opts) require("bqf").setup(opts) end,
  opts = {},
}

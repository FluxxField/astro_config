return {
  "ggandor/flit.nvim",
  dependiences = { "ggandor/leap.nvim", "tpope/vim-repeat" },
  cond = function() return require("user/customize").flit end,
  opts = {
    label_modes = "v",
    keys = { f = "f", F = "F", t = "t", T = "T" },
    multiline = true,
  },
  config = function(_, opts) require("flit").setup(opts) end,
}

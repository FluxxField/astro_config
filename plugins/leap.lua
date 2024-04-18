return {
  "ggandor/leap.nvim",
  dependencies = { "tpope/vim-repeat", event = "VeryLazy" },
  cond = function() return require("user/customize").leap end,
  keys = {
    { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
    { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
    { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
  },
  config = function(_, opts)
    local leap = require "leap"

    for key, value in pairs(opts) do
      leap.opts[key] = value
    end

    leap.create_default_mappings()
  end,
  opts = {},
}

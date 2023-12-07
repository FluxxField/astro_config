return {
  "rebelot/heirline.nvim",
  event = "BufEnter",
  cond = function() return require("user/customize").heirline end,
  config = function(...) require "plugins.configs.heirline"(...) end,
  opts = function(_, opts) return require("astronvim.utils").extend_tbl(opts, {}) end,
}

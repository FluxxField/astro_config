return {
  "phaazon/hop.nvim",
  event = "BufRead",
  config = function() require("hop").setup {} end,
  lazy = true,
  cmd = {},
  dependencies = {},
  opts = {},
  keys = {},
}

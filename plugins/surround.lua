-- https://github.com/kylechui/nvim-surround

return {
  "kylechui/nvim-surround",
  version = "*",
  event = "User AstroFile",
  config = function(_, opts) require("nvim-surround").setup(opts) end,
  opts = {},
}

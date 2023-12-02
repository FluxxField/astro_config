-- https://github.com/kylechui/nvim-surround

return {
  "kylechui/nvim-surround",
  version = "*",
  event = "User AstroFile",
  cond = function() return require("customize").nvim_surround end,
  config = function(_, opts) require("nvim-surround").setup(opts) end,
  opts = {},
}

-- https://github.com/phaazon/hop.nvim

return {
  "phaazon/hop.nvim",
  cond = function() return require("user/customize").hop end,
  event = "BufRead",
  config = function(_, opts) require("hop").setup(opts) end,
  opts = {
    keys = "ashtgyneoiqdrwbjfupzxmcvkl",
  },
}

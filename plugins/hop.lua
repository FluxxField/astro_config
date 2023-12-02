-- https://github.com/phaazon/hop.nvim

return {
  "phaazon/hop.nvim",
  cond = function() return require("customize").hop end,
  event = "BufRead",
  config = function(_, opts) require("hop").setup(opts) end,
  opts = {
    keys = "ashtgyneoiqdrwbjfupzxmcvkl",
  },
}

-- https://github.com/phaazon/hop.nvim
return {
  "phaazon/hop.nvim",
  event = "BufRead",
  config = function(_, opts) require("hop").setup(opts) end,
  opts = {
    keys = "ashtgyneoiqdrwbjfupzxmcvkl",
  },
}

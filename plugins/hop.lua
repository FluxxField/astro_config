-- https://github.com/phaazon/hop.nvim
return {
  "phaazon/hop.nvim",
  event = "BufRead",
  config = function() require("hop").setup() end,
}

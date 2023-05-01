-- https://github.com/michaelb/sniprun
return {
  "michaelb/sniprun",
  cmd = { "SnipRun" },
  build = "bash ./install.sh",
  config = function(_, opts) require("sniprun").setup(opts) end,
  opts = {},
}

-- https://github.com/carbon-steel/detour.nvim

return {
  "carbon-steel/detour.nvim",
  cond = function() return require("customize").detour end,
  cmd = { "Detour" },
  config = function(_, opts) require("detour").setup(opts) end,
  opts = {},
}

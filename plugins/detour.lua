-- https://github.com/carbon-steel/detour.nvim

return {
  "carbon-steel/detour.nvim",
  cmd = { "Detour" },
  config = function(_, opts) require("detour").setup(opts) end,
  opts = {},
}

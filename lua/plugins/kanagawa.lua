---@type LazySpec[]
return {
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    lazy = false,
  },
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      colorscheme = "kanagawa",
    },
  },
}

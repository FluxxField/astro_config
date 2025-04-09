return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        x = { -- `x` applies to both visual and visual line/block
          ["<A-j>"] = { ":move '>+1<CR>gv-gv", desc = "Move block down (sticky)" },
          ["<A-k>"] = { ":move '<-2<CR>gv-gv", desc = "Move block up (sticky)" },
        },
        n = {
          -- your normal mode mappings...
        },
      },
    },
  },
}

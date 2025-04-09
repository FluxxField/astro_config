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
          ["<leader>zz"] = { "zz", desc = "Center current line" },

          -- Search results centered
          ["n"] = { "nzzzv", desc = "Next search result centered" },
          ["N"] = { "Nzzzv", desc = "Prev search result centered" },

          -- Scroll centered
          ["<C-d>"] = { "<C-d>zz", desc = "Scroll down centered" },
          ["<C-u>"] = { "<C-u>zz", desc = "Scroll up centered" },

          -- Paragraph movement centered
          ["{"] = { "{zz", desc = "Back a paragraph centered" },
          ["}"] = { "}zz", desc = "Forward a paragraph centered" },

          -- Keep cursor in center after page jump
          ["G"] = { "Gzz", desc = "End of file centered" },
          ["gg"] = { "ggzz", desc = "Top of file centered" },
        },
      },
    },
  },
}

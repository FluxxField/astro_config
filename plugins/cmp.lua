-- https://github.com/hrsh7th/nvim-cmp
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-calc",
    "hrsh7th/cmp-emoji",
  },
  config = function() require("cmp").setup() end,
  event = "InsertEnter",
  opts = function(_, opts)
    local cmp = require "cmp"

    return require("astronvim.utils").extend_tbl(opts, {
      window = {
        completion = {
          border = "rounded",
          col_offset = 1,
          side_padding = 0,
        },
      },
      sources = cmp.config.sources {
        { name = "nvim_lsp", priority = 1000 },
        { name = "luasnip", priority = 800 },
        { name = "emoji", priority = 700 },
        { name = "calc", priority = 600 },
        { name = "path", priority = 500 },
        { name = "buffer", priority = 400 },
      },
    })
  end,
}

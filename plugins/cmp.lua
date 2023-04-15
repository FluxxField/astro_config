return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-calc",
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-vsnip",
  },
  opts = function(_, opts)
    local cmp = require "cmp"

    return require("astronvim.utils").extend_tbl(opts, {
      snippet = {
        expand = function(args) vim.fn["vsnip#anonymous"](args.body) end,
      },
      window = {
        completion = {
          border = "rounded",
          col_offset = 1,
          side_padding = 0,
        },
      },
      sources = cmp.config.sources {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
        { name = "nvim_lua" },
        { name = "calc" },
        { name = "emoji" },
        { name = "vsnip" },
        { name = "nvim_lsp" },
      },
    })
  end,
}

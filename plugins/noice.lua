-- https://github.com/folke/noice.nvim

return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "rcarriga/nvim-notify",
    "nvim-treesitter/nvim-treesitter",
    "MunifTanjim/nui.nvim",
  },
  cond = function() return require("user/customize").noice end,
  config = function(_, opts) require("noice").setup(opts) end,
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      signature = {
        enabled = false,
      },
      hover = {
        enabled = false,
      },
    },
  },
}

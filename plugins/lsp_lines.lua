-- https://github.com/Maan2003/lsp_lines.nvim

return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  lazy = false,
  cond = function() return require("user/customize").lsp_lines end,
  config = function() require("lsp_lines").setup() end,
  opts = {},
}

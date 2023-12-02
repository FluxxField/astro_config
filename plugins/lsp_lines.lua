-- https://github.com/Maan2003/lsp_lines.nvim

return {
  "Maan2003/lsp_lines.nvim",
  event = { "BufReadPre", "BufNewFile" },
  cond = function() return require("customize").lsp_lines end,
  config = function() require("lsp_lines").setup() end,
}

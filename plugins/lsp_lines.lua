-- https://github.com/Maan2003/lsp_lines.nvim
return {
  "Maan2003/lsp_lines.nvim",
  event = "User AstroFile",
  config = function() require("lsp_lines").setup() end,
}

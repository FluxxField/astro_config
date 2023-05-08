-- https://github.com/Maan2003/lsp_lines.nvim
return {
  "Maan2003/lsp_lines.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function() require("lsp_lines").setup() end,
  opts = {},
}

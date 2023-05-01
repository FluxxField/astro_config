-- https://github.com/jose-elias-alvarez/typescript.nvim
return {
  "jose-elias-alvarez/typescript.nvim",
  ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  config = function(_, opts) require("typescript").setup(opts) end,
  opts = {
    server = require("astronvim.utils.lsp").config "tsserver",
  },
}

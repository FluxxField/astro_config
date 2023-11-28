-- https://github.com/jose-elias-alvarez/typescript.nvim

return {
  "jose-elias-alvarez/typescript.nvim",
  ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  opts = {
    server = require("astronvim.utils.lsp").config "tsserver",
  },
}

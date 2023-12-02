-- https://github.com/jose-elias-alvarez/typescript.nvim

return {
  "jose-elias-alvarez/typescript.nvim",
  ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  cond = function() return require("customize").typescript end,
  config = function(_, opts) require("typescript").setup(opts) end,
  opts = {
    server = require("astronvim.utils.lsp").config "tsserver",
  },
}

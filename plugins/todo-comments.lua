-- https://github.com/folke/todo-comments.nvim
return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "User AstroFile",
  cmd = { "TodoQuickFix" },
  keys = {
    { "<leader>T", "<cmd>TodoTelescope<cr>", desc = "Open TODOs in Telescope" },
  },
  config = function(_, opts) require("todo-comments").setup(opts) end,
  opts = {},
}
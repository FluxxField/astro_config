-- https://github.com/folke/todo-comments.nvim

return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = { "TodoQuickFix" },
  keys = {
    { "<leader>T", "<cmd>TodoTelescope<cr>", desc = "Open TODOs in Telescope" },
  },
  opts = {},
}

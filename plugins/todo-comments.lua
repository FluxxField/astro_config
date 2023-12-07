-- https://github.com/folke/todo-comments.nvim

return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = { "TodoQuickFix" },
  keys = {
    { "<leader>T", "<cmd>TodoTelescope<cr>", desc = "Open TODOs in Telescope" },
  },
  cond = function() return require("user/customize").todo_comments end,
  config = function(_, opts) require("todo-comments").setup(opts) end,
  opts = {},
}

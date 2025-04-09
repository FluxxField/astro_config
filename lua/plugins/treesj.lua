---@type LazySpec
return {
  "Wansmer/treesj",
  keys = { { "<leader>m", function() require("treesj").toggle() end, desc = "Toggle Split/Join" } },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {},
}

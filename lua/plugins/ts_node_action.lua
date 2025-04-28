---@type LazySpec
return {
  "ckolkey/ts-node-action",
  keys = { { "ta", function() require("ts-node-action").node_action() end, desc = "Toggle Node Action" } },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {},
}

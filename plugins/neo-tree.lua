return {
  "nvim-neo-tree/neo-tree.nvim",
  config = function(_, opts) require("neo-tree").setup(opts) end,
  opts = {
    window = {
      position = "right",
      width = 50,
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
      },
    },
  },
}

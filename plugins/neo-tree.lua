return {
  "nvim-neo-tree/neo-tree.nvim",
  cond = function() return require("user/customize").neo_tree end,
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

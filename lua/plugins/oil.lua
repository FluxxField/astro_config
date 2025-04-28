---@type LazySpec
return {
  {
    "stevearc/oil.nvim",
    event = { "VeryLazy" },
    ---@module 'oil'
    ---@type oil.SetupOpts
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
  },
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["-"] = {
            function() require("oil").select() end,
            desc = "Oil.nvim: Select the entry under the cursor",
          },
        },
      },
    },
  },
}

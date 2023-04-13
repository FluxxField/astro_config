return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of importing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.completion.copilot-lua-cmp" },
  { import = "astrocommunity.pack.typescript", event = "InsertStart" },
  { import = "astrocommunity.motion.mini-ai" },
  { import = "astrocommunity.scrolling.cinnamon-nvim" },
  {
    "cinnamon.nvim",
    opts = {
      -- keymaps
      default_keymaps = true,
      extra_keymaps = true,
      extended_keymaps = true,
      override_keymaps = true,
      -- options
      always_scroll = false,
      centered = true,
      disabled = false,
      default_delay = 7,
      hide_cursor = false,
      horizontal_scroll = true,
      max_length = -1,
      scroll_limit = 150,
    },
  },
}

-- https://github.com/declancm/cinnamon.nvim
return {
  "declancm/cinnamon.nvim",
  event = "BufWinEnter",
  config = function(_, opts) require("cinnamon").setup(opts) end,
  opts = {
    -- keymaps
    default_keymaps = true,
    extra_keymaps = true,
    extended_keymaps = true,
    override_keymaps = true,
    -- options``
    always_scroll = false,
    centered = true,
    disabled = false,
    default_delay = 7,
    hide_cursor = false,
    horizontal_scroll = true,
    max_length = -1,
    scroll_limit = 150,
  },
}

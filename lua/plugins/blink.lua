-- Get the first matching ancestor node
---@type LazySpec
return {
  "saghen/blink.cmp",
  dependencies = {
    "xzbdmw/colorful-menu.nvim",
  },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    cmdline = { enabled = true },
    completion = {
      menu = {
        auto_show = true,
        draw = {
          columns = { { "kind_icon" }, { "label", gap = 1 } },
          components = {
            label = {
              text = function(ctx) return require("colorful-menu").blink_components_text(ctx) end,
              highlight = function(ctx) return require("colorful-menu").blink_components_highlight(ctx) end,
            },
          },
        },
      },
      trigger = {
        prefetch_on_insert = true,
        show_on_insert_on_trigger_character = true,
        show_on_trigger_character = true,
        show_on_keyword = true,
        show_on_blocked_trigger_characters = {},
      },
    },
    fuzzy = {
      implementation = "prefer_rust_with_warning",
    },
    sources = {
      min_keyword_length = 0,
    },
  },
}

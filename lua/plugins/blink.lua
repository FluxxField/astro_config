local ts_utils = require "nvim-treesitter.ts_utils"

local function is_in_function_args()
  local node = ts_utils.get_node_at_cursor()

  while node do
    local t = node:type()

    if t == "parameters" or t == "formal_parameters" or t == "arguments" or t == "object_pattern" then return true end

    node = node:parent()
  end

  return false
end

-- Get the first matching ancestor node
local function get_node_ancestor_of_type(targets)
  local node = ts_utils.get_node_at_cursor()

  while node do
    local t = node:type()

    if vim.tbl_contains(targets, t) then return t end

    node = node:parent()
  end

  return nil
end

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
      transform_items = function(ctx, items)
        local context = get_node_ancestor_of_type { "jsx_attribute", "property_identifier", "jsx_expression" }
        local in_args = is_in_function_args()

        return vim.tbl_filter(function(item)
          local is_lsp = item.source_name == "LSP"

          if in_args then return is_lsp end

          if context == "property_identifier" then
            -- Inside <Button da|> - show only LSP props
            return is_lsp
          elseif context == "jsx_expression" then
            -- Inside disabled={|} - TODO: filter based on type of the attribute
            return is_lsp
          end

          return item.kind ~= require("blink.cmp.types").CompletionItemKind.Snippet
        end, items)
      end,
    },
  },
}

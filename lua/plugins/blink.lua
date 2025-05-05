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

---@type LazySpec
return {
  "saghen/blink.cmp",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    cmdline = { enabled = true },
    completion = {
      menu = {
        auto_show = true,
      },
    },
    fuzzy = {
      implementation = "prefer_rust_with_warning",
    },
    sources = {
      min_keyword_length = 0,
      transform_items = function(ctx, items)
        local in_args = is_in_function_args()

        return vim.tbl_filter(function(item)
          local is_lsp = item.source_name == "LSP"

          if in_args then return is_lsp end

          return true
        end, items)
      end,
    },
  },
}

local languages = require "consts.language_packs"

local function collect_treesitter_languages()
  local ts_langs = {}
  local seen = {}

  for _, lang in pairs(languages) do
    for _, ts in ipairs(lang.treesitter or {}) do
      if not seen[ts] then
        table.insert(ts_langs, ts)
        seen[ts] = true
      end
    end
  end

  return ts_langs
end

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  opts = {
    auto_install = true,
    ensure_installed = collect_treesitter_languages(),
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
          ["ao"] = "@object.outer",
          ["io"] = "@object.inner",
          ["ak"] = "@key.outer",
          ["ik"] = "@key.inner",
          ["av"] = "@value.outer",
          ["iv"] = "@value.inner",
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["at"] = "@jsx.outer",
          ["it"] = "@jsx.inner",
        },
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          ["]f"] = "@function.outer",
          ["]a"] = "@parameter.outer",
          ["]t"] = "@jsx.outer",
        },
        goto_previous_start = {
          ["[f"] = "@function.outer",
          ["[a"] = "@parameter.outer",
          ["[t"] = "@jsx.outer",
        },
      },
      swap = {
        enable = true,
        swap_next = {
          [">a"] = "@parameter.inner",
        },
        swap_previous = {
          ["<a"] = "@parameter.inner",
        },
      },
    },
  },
}

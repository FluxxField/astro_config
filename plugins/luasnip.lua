return {
  "L3MON4D3/LuaSnip",
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "v2.*",
  build = "make install_jsregexp",
  config = function(...) require "plugins.configs.luasnip"(...) end,
  opts = function(_, opts) return require("astronvim.utils").extend_tbl(opts, {}) end,
}

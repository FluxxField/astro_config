return {
  "L3MON4D3/LuaSnip",
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "v2.*",
  build = vim.fn.has "win32" == 0
      and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build\n'; make install_jsregexp"
    or nil,
  cond = function() return require("customize").luasnip end,
  config = function(...) require "plugins.configs.luasnip"(...) end,
  opts = function(_, opts) return require("astronvim.utils").extend_tbl(opts, {}) end,
}

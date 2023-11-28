-- https://github.com/xiyaowong/transparent.nvim

return {
  "xiyaowong/transparent.nvim",
  lazy = false,
  opts = {
    exclude_groups = {
      "NotifyBackground"
    }
  },
  config = function(_, opts)
    local transparent = require("transparent");

    transparent.clear_prefix('NeoTree');

    transparent.setup(opts)
  end,
}

-- https://github.com/xiyaowong/transparent.nvim

return {
  "xiyaowong/transparent.nvim",
  config = function()
    local transparent = require("transparent");

    transparent.clear_prefix('NeoTree');

    transparent.setup({
      exclude_groups = {
        "NotifyBackground"
      }
    })
  end,
  lazy = false,
}

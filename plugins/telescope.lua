-- https://github.com/nvim-telescope/telescope.nvim
-- https://github.com/nvim-telescope/telescope-hop.nvim
-- https://github.com/nvim-telescope/telescope-file-browser.nvim
-- https://github.com/axkirillov/telescope-changed-files

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-hop.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  cond = function() return require("customize").telescope end,
  config = function(...)
    local telescope = require "telescope"

    require "plugins.configs.telescope"(...)

    telescope.load_extension "file_browser"
    telescope.load_extension "hop"
  end,
  opts = function(_, opts)
    local telescope = require "telescope"
    local actions = require "telescope.actions"
    local fb_actions = telescope.extensions.file_browser.actions
    local hop = telescope.extensions.hop

    return require("astronvim.utils").extend_tbl(opts, {
      defaults = {
        mappings = {
          i = {
            ["<C-h>"] = hop.hop,
            ["<C-space>"] = function(promp_bufnr)
              hop._hop_loop(
                promp_bufnr,
                { callback = actions.toggle_selection, loop_callback = actions.send_selected_to_qflist }
              )
            end,
          },
        },
        extensions = {
          file_browser = {
            mappings = {
              i = {
                ["<C-z>"] = fb_actions.toggle_hidden,
              },
              n = {
                z = fb_actions.toggle_hidden,
              },
            },
          },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
          buffers = {
            path_display = { "smart" },
            mappings = {
              i = {
                ["<C-d>"] = actions.delete_buffer,
              },
              n = {
                ["<C-d>"] = actions.delete_buffer,
              },
            },
          },
        },
      },
    })
  end,
}

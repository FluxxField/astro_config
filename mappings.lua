local astro_utils = require "astronvim.utils"

-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  n = {
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    ["<leader>b"] = { name = "Buffers" },
    -- Buffer switching
    ["<Tab>"] = {
      function()
        if #vim.t.bufs > 1 then
          require("telescope.builtin").buffers { sort_mru = true, ignore_current_buffer = true }
        else
          astro_utils.notify "No other buffers open"
        end
      end,
      desc = "Switch Buffers",
    },
    ["<S-l>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.vount or 1) end,
      desc = "Previous buffer",
    },
    ["<S-h>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.vount or 1)) end,
      desc = "Previous buffer",
    },
    ["<leader>o"] = { "o<Esc>" },
    ["<leader>O"] = { "O<Esc>" },
    ["<leader>z"] = { "<cmd>ZenMode<cr>", desc = "Zen Mode" },
    ["<esc>"] = false,
  },
  t = {
    -- setting a mapping to false will disable it
    ["<esc>"] = false,
  },
  v = {
    ["J"] = { ":m '>+1<CR>gv=gv", desc = "Move line down" },
    ["K"] = { ":m '<-2<CR>gv=gv", desc = "Move line up" },
    ["<"] = { "<gv", desc = "Shift left" },
    [">"] = { ">gv", desc = "Shift right" },
  },
}

local astro_utils = require "astronvim.utils"
local harpoon = require "harpoon"
-- local hop = require "hop"
-- local hint = require "hop.hint"
-- local directions = hint.HintDirection
-- local position = hint.HintPosition

return {
  n = {
    -- LSP
    ["<leader>k"] = { function() vim.lsp.buf.hover() end, desc = "LSP Hover" },
    ["<leader>b"] = { name = "Buffers" },
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },

    -- Buffer switching
    -- NOTE: Maybe add detour? Or add another keybind
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

    -- oil
    ["-"] = {
      function()
        vim.cmd [[50vsplit]]
        vim.cmd [[Oil]]
      end,
      desc = "Open parent directory",
    },

    -- harpoon
    ["<leader>h"] = { false, desc = "Harpoon" },
    ["<leader>hh"] = { function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Harpoon toggle" },
    ["<leader>ha"] = { function() harpoon:list():add() end, desc = "Harpoon add to list" },
    ["<leader>hr"] = { function() harpoon:list():remove() end, desc = "Harpoon remove from list" },
    ["<leader>h1"] = { function() harpoon:list():select(1) end, desc = "Harpoon select 1" },
    ["<leader>h2"] = { function() harpoon:list():select(2) end, desc = "Harpoon select 2" },
    ["<leader>h3"] = { function() harpoon:list():select(3) end, desc = "Harpoon select 3" },
    ["<leader>h4"] = { function() harpoon:list():select(4) end, desc = "Harpoon select 4" },

    -- telescope
    ["<leader>fq"] = { "<cmd>Telescope quickfix<cr>", desc = "Find quickfix" },
    ["<leader>cf"] = { "<cmd>Telescope changed_files<cr>", desc = "Find changed files" },

    -- Zen Mode
    ["<leader>z"] = { "<cmd>ZenMode<cr>", desc = "Zen Mode" },

    -- portal
    -- ["<leader>o"] = { "<cmd>Portal jumplist backward<cr>", desc = "Portal jump backward" },
    -- ["<leader>i"] = { "<cmd>Portal jumplist forward<cr>", desc = "Portal jump forward" },

    -- Hop
    -- ["<leader><leader>o"] = {
    --   function()
    --     vim.cmd [[:HopLineStart]]
    --     vim.schedule(function()
    --       vim.cmd [[normal! o]]
    --       vim.cmd [[normal! o]]
    --       vim.cmd [[startinsert]]
    --     end)
    --   end,
    --   desc = "Hop Line Insert new line below",
    -- },
    -- ["<leader><leader>O"] = {
    --   function()
    --     vim.cmd [[:HopLineStart]]
    --     vim.schedule(function()
    --       vim.cmd [[normal! O]]
    --       vim.cmd [[normal! O]]
    --       vim.cmd [[startinsert]]
    --     end)
    --   end,
    --   desc = "Hop Line Insert new line above",
    -- },

    -- easymotion-like
    -- ["<leader><leader>w"] = {
    --   function()
    --     hop.hint_words {
    --       direction = directions.AFTER_CURSOR,
    --     }
    --   end,
    --   desc = "Hop Word after cursor",
    -- },
    -- ["<leader><leader>b"] = {
    --   function()
    --     hop.hint_words {
    --       direction = directions.BEFORE_CURSOR,
    --     }
    --   end,
    --   desc = "Hop Word before cursor",
    -- },
    -- ["<leader><leader>j"] = {
    --   function()
    --     hop.hint_lines_skip_whitespace {
    --       direction = directions.AFTER_CURSOR,
    --     }
    --   end,
    --   desc = "Hop Line after cursor",
    -- },
    -- ["<leader><leader>k"] = {
    --   function()
    --     hop.hint_lines_skip_whitespace {
    --       direction = directions.BEFORE_CURSOR,
    --     }
    --   end,
    --   desc = "Hop line before cursor",
    -- },

    -- sneak-like
    -- ["e"] = {
    --   function()
    --     hop.hint_words {
    --       direction = directions.AFTER_CURSOR,
    --       hint_position = position.END,
    --     }
    --   end,
    --   desc = "Hop end of word after cursor",
    -- },
    -- ["ge"] = {
    --   function()
    --     hop.hint_words {
    --       direction = directions.BEFORE_CURSOR,
    --       hint_position = position.END,
    --     }
    --   end,
    --   desc = "Hop end of word after cursor",
    -- },

    -- Detour
    ["<leader>gd"] = {
      function()
        require("detour").Detour()

        vim.lsp.buf.definition()
      end,
      desc = "Open detour and go to global definition",
    },

    -- Pretty Hover
    ["<leader>lp"] = { function() require("pretty_hover").hover() end, desc = "Open Pretty Hover" },

    ["<esc>"] = false,
  },
  v = {
    ["J"] = { ":m '>+1<CR>gv=gv", desc = "Move line down" },
    ["K"] = { ":m '<-2<CR>gv=gv", desc = "Move line up" },
    ["<"] = { "<gv", desc = "Shift left" },
    [">"] = { ">gv", desc = "Shift right" },

    -- easymotion-like
    -- ["<leader><leader>w"] = {
    --   function()
    --     hop.hint_words {
    --       direction = directions.AFTER_CURSOR,
    --     }
    --   end,
    --   desc = "Hop Word after cursor",
    -- },
    -- ["<leader><leader>b"] = {
    --   function()
    --     hop.hint_words {
    --       direction = directions.BEFORE_CURSOR,
    --     }
    --   end,
    --   desc = "Hop Word before cursor",
    -- },
    -- ["<leader><leader>j"] = {
    --   function()
    --     hop.hint_lines_skip_whitespace {
    --       direction = directions.AFTER_CURSOR,
    --     }
    --   end,
    --   desc = "Hop Line after cursor",
    -- },
    -- ["<leader><leader>k"] = {
    --   function()
    --     hop.hint_lines_skip_whitespace {
    --       direction = directions.BEFORE_CURSOR,
    --     }
    --   end,
    --   desc = "Hop line before cursor",
    -- },

    -- sneak-like
    -- ["e"] = {
    --   function()
    --     hop.hint_words {
    --       direction = directions.AFTER_CURSOR,
    --       hint_position = position.END,
    --     }
    --   end,
    --   desc = "Hop end of word after cursor",
    -- },
    -- ["ge"] = {
    --   function()
    --     hop.hint_words {
    --       direction = directions.BEFORE_CURSOR,
    --       hint_position = position.END,
    --     }
    --   end,
    --   desc = "Hop end of word after cursor",
    -- },
    ["<esc>"] = false,
  },
  t = {
    ["<esc>"] = false,
  },
}

local astro_utils = require "astronvim.utils"
local hop = require "hop"
local hint = require "hop.hint"
local directions = hint.HintDirection
local position = hint.HintPosition

return {
  n = {
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
    -- telescope
    ["<leader>fq"] = { "<cmd>Telescope quickfix<cr>", desc = "Find quickfix" },
    ["<leader>cf"] = { "<cmd>Telescope changed_files<cr>", desc = "Find changed files" },
    -- Sandwich
    ["sa"] = { desc = "Sandwich add{motion/textobject}{addition}" },
    ["sd"] = { desc = "Sandwich delete{deletion}" },
    ["sr"] = { desc = "Sandwich replace{deletion}{addition}" },
    ["ss"] = { desc = "Sandwich select" },
    -- Zen Mode
    ["<leader>z"] = { "<cmd>ZenMode<cr>", desc = "Zen Mode" },
    -- fine-cmdline
    [":"] = { "<cmd>FineCmdline<cr>", desc = "Fine Command line" },
    -- portal
    ["<leader>o"] = { '<cmd>Portal jumplist backward<cr>', desc = "Portal jump backward" },
    ["<leader>i"] = { '<cmd>Portal jumplist forward<cr>', desc = "Portal jump forward" },
    -- Hop
    ["<leader><leader>o"] = {
      function()
        vim.cmd [[:HopLineStart]]
        vim.schedule(function()
          vim.cmd [[normal! o]]
          vim.cmd [[normal! o]]
          vim.cmd [[startinsert]]
        end)
      end,
      desc = "Hop Line Insert new line below",
    },
    ["<leader><leader>O"] = {
      function()
        vim.cmd [[:HopLineStart]]
        vim.schedule(function()
          vim.cmd [[normal! O]]
          vim.cmd [[normal! O]]
          vim.cmd [[startinsert]]
        end)
      end,
      desc = "Hop Line Insert new line above",
    },
    -- easymotion-like
    ["<leader><leader>w"] = {
      function()
        hop.hint_words {
          direction = directions.AFTER_CURSOR,
        }
      end,
      desc = "Hop Word after cursor",
    },
    ["<leader><leader>b"] = {
      function()
        hop.hint_words {
          direction = directions.BEFORE_CURSOR,
        }
      end,
      desc = "Hop Word before cursor",
    },
    ["<leader><leader>j"] = {
      function()
        hop.hint_lines_skip_whitespace {
          direction = directions.AFTER_CURSOR,
        }
      end,
      desc = "Hop Line after cursor",
    },
    ["<leader><leader>k"] = {
      function()
        hop.hint_lines_skip_whitespace {
          direction = directions.BEFORE_CURSOR,
        }
      end,
      desc = "Hop line before cursor",
    },
    -- sneak-like
    ["s"] = { "<cmd>HopChar2AC<cr>", desc = "Hop Char2 after cursor" },
    ["S"] = { "<cmd>HopChar2BC<cr>", desc = "Hop Char2 before cursor" },
    ["e"] = {
      function()
        hop.hint_words {
          direction = directions.AFTER_CURSOR,
          hint_position = position.END,
        }
      end,
      desc = "Hop end of word after cursor",
    },
    ["ge"] = {
      function()
        hop.hint_words {
          direction = directions.BEFORE_CURSOR,
          hint_position = position.END,
        }
      end,
      desc = "Hop end of word after cursor",
    },
    ["f"] = {
      function()
        hop.hint_char1 {
          direction = directions.AFTER_CURSOR,
          current_line_only = true,
        }
      end,
      desc = "Hop to char after cursor current line",
    },
    ["F"] = {
      function()
        hop.hint_char1 {
          direction = directions.BEFORE_CURSOR,
          current_line_only = true,
        }
      end,
      desc = "Hop to char before cursor current line",
    },
    ["t"] = {
      function()
        hop.hint_char1 {
          direction = directions.AFTER_CURSOR,
          current_line_only = true,
          hint_offset = -1,
        }
      end,
      desc = "Hop to char after cursor current line offset",
    },
    ["T"] = {
      function()
        hop.hint_char1 {
          direction = directions.AFTER_CURSOR,
          current_line_only = true,
          hint_offset = 1,
        }
      end,
      desc = "Hop to char before cursor current line offset",
    },
    ["<esc>"] = false,
  },
  t = {
    ["<esc>"] = false,
  },
  v = {
    ["J"] = { ":m '>+1<CR>gv=gv", desc = "Move line down" },
    ["K"] = { ":m '<-2<CR>gv=gv", desc = "Move line up" },
    ["<"] = { "<gv", desc = "Shift left" },
    [">"] = { ">gv", desc = "Shift right" },
    -- Hop
    -- easymotion-like
    ["<leader><leader>w"] = {
      function()
        hop.hint_words {
          direction = directions.AFTER_CURSOR,
        }
      end,
      desc = "Hop Word after cursor",
    },
    ["<leader><leader>b"] = {
      function()
        hop.hint_words {
          direction = directions.BEFORE_CURSOR,
        }
      end,
      desc = "Hop Word before cursor",
    },
    ["<leader><leader>j"] = {
      function()
        hop.hint_lines_skip_whitespace {
          direction = directions.AFTER_CURSOR,
        }
      end,
      desc = "Hop Line after cursor",
    },
    ["<leader><leader>k"] = {
      function()
        hop.hint_lines_skip_whitespace {
          direction = directions.BEFORE_CURSOR,
        }
      end,
      desc = "Hop line before cursor",
    },
    -- sneak-like
    ["s"] = { "<cmd>HopChar2AC<cr>", desc = "Hop Char2 after cursor" },
    ["S"] = { "<cmd>HopChar2BC<cr>", desc = "Hop Char2 before cursor" },
    ["e"] = {
      function()
        hop.hint_words {
          direction = directions.AFTER_CURSOR,
          hint_position = position.END,
        }
      end,
      desc = "Hop end of word after cursor",
    },
    ["ge"] = {
      function()
        hop.hint_words {
          direction = directions.BEFORE_CURSOR,
          hint_position = position.END,
        }
      end,
      desc = "Hop end of word after cursor",
    },
    ["f"] = {
      function()
        hop.hint_char1 {
          direction = directions.AFTER_CURSOR,
          current_line_only = true,
        }
      end,
      desc = "Hop to char after cursor current line",
    },
    ["F"] = {
      function()
        hop.hint_char1 {
          direction = directions.BEFORE_CURSOR,
          current_line_only = true,
        }
      end,
      desc = "Hop to char before cursor current line",
    },
    ["t"] = {
      function()
        hop.hint_char1 {
          direction = directions.AFTER_CURSOR,
          current_line_only = true,
          hint_offset = -1,
        }
      end,
      desc = "Hop to char after cursor current line offset",
    },
    ["T"] = {
      function()
        hop.hint_char1 {
          direction = directions.AFTER_CURSOR,
          current_line_only = true,
          hint_offset = 1,
        }
      end,
      desc = "Hop to char before cursor current line offset",
    },
    ["<esc>"] = false,
  },
}

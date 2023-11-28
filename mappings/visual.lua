local hop = require "hop"
local hint = require "hop.hint"
local directions = hint.HintDirection
local position = hint.HintPosition

return {
  ["J"] = { ":m '>+1<CR>gv=gv", desc = "Move line down" },
  ["K"] = { ":m '<-2<CR>gv=gv", desc = "Move line up" },
  ["<"] = { "<gv", desc = "Shift left" },
  [">"] = { ">gv", desc = "Shift right" },

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
      hop.hint_lines {
        direction = directions.AFTER_CURSOR,
      }
    end,
    desc = "Hop Line after cursor",
  },
  ["<leader><leader>k"] = {
    function()
      hop.hint_lines {
        direction = directions.BEFORE_CURSOR,
      }
    end,
    desc = "Hop line before cursor",
  },

  -- sneak-like
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
  ["<esc>"] = false,
}

-- https://github.com/FluxxField/bionic-reading.nvim

return {
  'FluxxField/bionic-reading.nvim',
  event = 'BufRead',
  cmd = { 'BRToggle', 'BRToggleUpdateInInsert' },
  config = function(_, opts)
    require('bionic-reading').setup(opts)
  end,
  opts = {
    auto_highlight = true,
    file_types = {
      ['text'] = {
        'any',
      },
      ['lua'] = {
        'comment',
      },
      ['javascript'] = {
        'comment',
      },
    },
    hl_group_value = {
      link = 'bold',
    },
    prompt_user = true,
    treesitter = true,
    update_in_insert_mode = true,
  },
}

-- return {
--   "FluxxField/bionic-reading.nvim",
--   dev = true,
--   lazy = false,
--   config = function(_, opts)
--     require('bionic-reading').setup(opts)
--   end,
--   opts = {
--     auto_highlight = true,
--     file_types = {
--       ['text'] = {
--         'all',
--       },
--       ['lua'] = {
--         'comment',
--       },
--     },
--     hl_group_value = {
--       link = 'bold',
--     },
--     prompt_user = true,
--     treesitter = true,
--     update_in_insert_mode = true,
--   },
-- }

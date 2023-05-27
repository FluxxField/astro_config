-- https://github.com/FluxxField/bionic-reading.nvim

return {
  'FluxxField/bionic-reading.nvim',
  event = 'BufRead',
  filetypes = { 'text' },
  cmd = { 'BRToggle', 'BRToggleUpdateInInsert' },
  lazy = false,
  config = function()
    require('bionic-reading').setup()
  end
}

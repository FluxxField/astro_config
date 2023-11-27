-- https://github.com/carbon-steel/detour.nvim

return {
  'carbon-steel/detour.nvim',
  cmd = {'Detour'},
  config = function ()
    vim.keymap.set('n', '<c-w><enter>', ':Detour<cr>')
  end
}

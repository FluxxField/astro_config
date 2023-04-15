-- auto stop auto-compiler if its running
vim.api.nvim_create_autocmd("VimLeave", {
  desc = "Stop running auto-compiler",
  group = vim.api.nvim_create_augroup("autocomp", { clear = true }),
  pattern = "*",
  callback = function() vim.fn.jobstop { "autocomp", vim.fn.expand "%:p", "stop" } end,
})

-- disable virtual lines in floating windows
vim.api.nvim_create_autocmd("WinEnter", {
  callback = function()
    local floating = vim.api.nvim_win_get_config(0).relative ~= ""

    vim.diagnostic.config {
      virtual_text = floating,
      virtual_lines = not floating,
    }
  end,
})

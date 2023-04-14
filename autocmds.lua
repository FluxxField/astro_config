-- auto stop auto-compiler if its running
vim.api.nvim_create_autocmd("VimLeave", {
  desc = "Stop running auto-compiler",
  group = vim.api.nvim_create_augroup("autocomp", { clear = true }),
  pattern = "*",
  callback = function() vim.fn.jobstop { "autocomp", vim.fn.expand "%:p", "stop" } end,
})

return function(client, bufnr)
  local diagnostics_active = true
  local lsp_format_on_save = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = true })

  client.config.flags = { debounce_text_changes = 150 }

  vim.keymap.set("n", "<leader>lt", function()
    if diagnostics_active then
      vim.diagnostic.hide()
      diagnostics_active = false
    else
      vim.diagnostic.show()
      diagnostics_active = true
    end
  end, { buffer = bufnr, desc = "Toggle diagnostics" })

  -- vim.api.nvim_clear_autocmds { group = lsp_format_on_save, buffer = bufnr }
  -- vim.api.nvim_create_autocmd("BufWritePre", {
  --   group = lsp_format_on_save,
  --   desc = "Format on save",
  --   buffer = bufnr,
  --   callback = function()
  --     vim.lsp.buf.format {
  --       bufnr = bufnr,
  --       timeout_ms = 1500,
  --       filter = function(localClient) return localClient.name ~= "tsserver" end,
  --     }
  --   end,
  -- })
end

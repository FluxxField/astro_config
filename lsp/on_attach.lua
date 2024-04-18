local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

return function(client, bufnr)
  local diagnostics_active = true

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

  vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format {
        bufnr = bufnr,
        async = false,
        filter = function(localClient) return localClient.name ~= "tsserver" end,
      }
    end,
  })
end

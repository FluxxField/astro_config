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
end

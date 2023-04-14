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

  -- Set autocommands conditional on server_capabilities
  if client.name == "tsserver" then
    vim.diagnostic.disable(nil, client.id)
    client.server_capabilities.document_formatting = false
  end

  if client.name == "eslint" then client.server_capabilities.document_formatting = false end

  if client.server_capabilities.document_formatting then
    vim.api.nvim_create_augroup("format_on_save", { clear = true })

    vim.api.nvim_create_augroup("BufWritePre", {
      desc = "Auto format before save",
      event = "format_on_save",
      pattern = { "<buffer>" },
      callback = function() vim.lsp.buf.formatting_sync { async = true } end,
    })
  end
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim

return {
  "jose-elias-alvarez/null-ls.nvim",
  cond = function() return require("user/customize").null_ls end,
  config = function()
    local null_ls = require "null-ls"
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local code_actions = null_ls.builtins.code_actions

    null_ls.setup {
      default_timeout = 2000,
      sources = {
        -- misc
        diagnostics.codespell,
        -- JS/TS
        -- diagnostics.eslint_d,
        diagnostics.tsc,
        formatting.eslint_d,
        formatting.prettierd,
        code_actions.eslint_d,
        -- CSS
        diagnostics.stylelint,
        formatting.stylelint,
        -- Lua
        -- diagnostics.luacheck,
        formatting.stylua,
      },
      -- on_attach = function(client, bufnr)
      --   if client.server_capabilities.document_formatting then
      --     local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = true })
      --
      --     vim.api.nvim_clear_autocmds { group = group, buffer = bufnr }
      --     vim.api.nvim_create_autocmd("BufWritePre", {
      --       group = group,
      --       desc = "Auto format before save",
      --       buffer = bufnr,
      --       callback = function()
      --         vim.lsp.buf.format {
      --           bufnr = bufnr,
      --           timeout_ms = 1500,
      --           filter = function(localClient) return localClient.name ~= "tsserver" end,
      --         }
      --       end,
      --     })
      --   end
      -- end,
    }
  end,
}

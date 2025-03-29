---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    autocmds = {
      lsp_hover_lines = {
        cond = function(client) return client.supports_method "textDocument/publishDiagnostics" end,
        {
          event = { "CursorHold", "CursorHoldI" },
          desc = "Show current line diagnostics with lsp_lines",
          callback = function()
            vim.diagnostic.config {
              virtual_lines = { only_current_line = true },
              virtual_text = false,
            }
          end,
        },
        {
          event = "CursorMoved",
          desc = "Hide current line lsp_lines diagnostics",
          callback = function()
            vim.diagnostic.config {
              virtual_lines = false,
              virtual_text = false,
            }
          end,
        },
      },

      tailwindcss_sort_on_save = {
        cond = function(_, bufnr)
          local ft = vim.bo[bufnr].filetype
          return vim.tbl_contains({ "typescriptreact", "javascriptreact" }, ft)
        end,
        {
          event = "BufWritePre",
          desc = "Auto-run TailwindSort after saving",
          callback = function() pcall(vim.cmd, "TailwindSort") end,
        },
      },

      react_on_save = {
        cond = function(client, bufnr)
          local ft = vim.bo[bufnr].filetype

          return client.name == "vtsls"
            and vim.tbl_contains({ "typescript", "typescriptreact", "javascript", "javascriptreact" }, ft)
        end,
        {
          event = "BufWritePre",
          desc = "Auto-run VTSLS source actions after saving",
          callback = function(args)
            local ok, vtsls = pcall(require, "vtsls")
            if not ok then return end

            vtsls.commands.add_missing_imports(
              args.buf,
              function() end,
              function(err) vim.notify("[vtsls] add_missing_imports failed: " .. tostring(err), vim.log.levels.ERROR) end
            )

            vtsls.commands.remove_unused_imports(
              args.buf,
              function() end,
              function(err) vim.notify("[vtsls] remove_unused_imports failed: " .. tostring(err), vim.log.levels.ERROR) end
            )

            -- vtsls.commands.remove_unused(
            --   args.buf,
            --   function() end,
            --   function(err) vim.notify("[vtsls] remove_unused failed: " .. tostring(err), vim.log.levels.ERROR) end
            -- )
          end,
        },
      },
    },
  },
}

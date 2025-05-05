---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    autocmds = {
      center_on_file_open = {
        {
          event = "BufReadPost",
          desc = "Center the cursor at the last place it was at when you open a file",
          callback = function()
            local mark = vim.api.nvim_buf_get_mark(0, '"')
            local lcount = vim.api.nvim_buf_line_count(0)

            if mark[1] > 0 and mark[1] <= lcount then
              pcall(vim.api.nvim_win_set_cursor, 0, mark)
              vim.cmd "normal! zz"
            end
          end,
        },
      },

      zellij_on_leave = {
        {
          event = "VimLeave",
          desc = "Ensure Zellij returns to normal mode on exit",
          callback = function() os.execute "zellij action switch-mode normal" end,
        },
      },

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

          return vim.tbl_contains({ "vtsls" }, client.name)
            and vim.tbl_contains({ "typescript", "typescriptreact", "javascript", "javascriptreact" }, ft)
        end,
        {
          event = "BufWritePre",
          desc = "Auto-run VTSLS source actions for imports before write",
          callback = function(args)
            -- local bufnr = args.buf
            -- local clients = vim.lsp.get_clients { bufnr = bufnr }
            --
            -- local has_vtsls = false
            --
            -- for _, client in ipairs(clients) do
            --   if client.name == "vtsls" then has_vtsls = true end
            -- end
            --
            -- -- prevent a retrigger
            -- vim.api.nvim_clear_autocmds { event = "BufWritePre", buffer = bufnr }
            --
            -- local pending = 0
            -- local errored = false
            --
            -- local function on_resolve()
            --   pending = pending - 1
            --   if pending == 0 and not errored then vim.cmd "noautocmd write" end
            -- end
            --
            -- local function on_error(err)
            --   errored = true
            --   vim.notify("[react_on_save] action failed: " .. tostring(err), vim.log.levels.ERROR)
            -- end
            --
            -- -- VTSLS
            -- if has_vtsls then
            --   local ok, vtsls = pcall(require, "vtsls")
            --
            --   if ok and type(bufnr) == "number" then
            --     pending = pending + 2
            --
            --     local success, err = pcall(vtsls.commands.add_missing_imports, bufnr, on_resolve, on_error)
            --     if not success then vim.notify("add_missing_imports error: " .. tostring(err), vim.log.levels.ERROR) end
            --
            --     success, err = pcall(vtsls.commands.remove_unused_imports, bufnr, on_resolve, on_error)
            --     if not success then
            --       vim.notify("remove_unused_imports error: " .. tostring(err), vim.log.levels.ERROR)
            --     end
            --   end
            -- end
            --
            -- -- Block write
            -- vim.schedule(function() end)
          end,
        },
      },
    },
  },
}

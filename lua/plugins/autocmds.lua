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
    },
  },
}

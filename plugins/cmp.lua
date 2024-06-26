-- https://github.com/hrsh7th/nvim-cmp
-- https://github.com/hrsh7th/cmp-nvim-lsp
-- https://github.com/hrsh7th/cmp-calc
-- https://github.com/hrsh7th/cmp-emoji
-- https://github.com/hrsh7th/cmp-cmdline
-- https://github.com/David-Kunz/cmp-npm
-- https://github.com/rafamadriz/friendly-snippets

local log = require("plenary.log").new { plugin = "cmp", level = "debug" }

local ts_utils = require "nvim-treesitter.ts_utils"

local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lsp-signature-help" },
    { "hrsh7th/cmp-nvim-lua" },
    { "hrsh7th/cmp-calc" },
    { "hrsh7th/cmp-emoji" },
    { "hrsh7th/cmp-cmdline" },
    { "David-Kunz/cmp-npm" },
    { "FelipeLema/cmp-async-path" },
  },
  event = "InsertEnter",
  cond = function() return require("user/customize").cmp end,
  config = function(_, opts)
    local cmp = require "cmp"

    cmp.setup.cmdline("/", {
      sources = cmp.config.sources {
        { name = "buffer" },
      },
      mapping = cmp.mapping.preset.cmdline(),
    })

    cmp.setup.cmdline(":", {
      sources = cmp.config.sources {
        { name = "path" },
        {
          name = "cmdline",
          option = {
            ignore_cmds = { "Man", "!" },
          },
        },
      },
      mapping = cmp.mapping.preset.cmdline(),
    })

    cmp.setup(opts)
  end,
  opts = function(_, opts)
    local cmp = require "cmp"
    local lspkind = require "lspkind"

    return require("astronvim.utils").extend_tbl(opts, {
      completion = {
        completeopt = table.concat(vim.opt.completeopt:get(), ""),
        autocomplete = {
          cmp.TriggerEvent.TextChanged,
          cmp.TriggerEvent.InsertEnter,
        },
        keyword_length = 0,
      },
      preselect = cmp.PreselectMode.None,
      window = {
        completion = {
          border = "rounded",
          col_offset = 1,
          side_padding = 0,
        },
      },
      sorting = {
        comparators = {
          cmp.config.compare.exact,
          cmp.config.compare.recently_used,
        },
      },
      formatting = {
        format = lspkind.cmp_format {
          mode = "symbol",
          max_width = 50,
          symbol_map = { Copilot = "" },
          before = function(entry, vim_item)
            local kind = vim_item.kind or "" -- Class, Method, Variable, etc...
            vim_item.kind = kind

            local cmp_source = entry.source.name or "" -- nvim_lsp, copilot, buffer, etc...
            vim_item.menu = "[" .. cmp_source .. "]"

            -- local item = entry:get_completion_item()
            -- if item and item.detail then vim_item.menu = item.detail end

            return vim_item
          end,
        },
      },
      sources = cmp.config.sources {
        { name = "copilot" },
        {
          name = "nvim_lsp",
          -- entry_filter = function(entry, context)
          --   local kind = entry:get_kind()
          --   local node = ts_utils.get_node_at_cursor()
          --
          --   if node and node:type() == "arguments" then
          --     if kind == 6 then return true end
          --   end
          --
          --   return false
          -- end,
        },
        { name = "nvim_lsp_signature_help" },
        { name = "nvim_lua" },
        { name = "npm" },
        {
          name = "async_path",
          -- TODO: Limit path to only show in strings
          -- entry_filter = function(entry, context) return true end,
        },
        -- { name = "buffer", keyword_length = 3 },
        { name = "calc" },
        { name = "emoji" },
      },
      mapping = {
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
        ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
        ["<CR>"] = cmp.mapping.confirm { select = false, behavior = cmp.ConfirmBehavior.Replace },
        ["<C-e>"] = cmp.mapping.close(),
        ["<C-Space"] = cmp.mapping.complete(),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item { behavior = cmp.SelectBehavior.Replace }
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item { behavior = cmp.SelectBehavior.Replace }
          else
            fallback()
          end
        end, { "i", "s" }),
      },
    })
  end,
}

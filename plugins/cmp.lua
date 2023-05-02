-- https://github.com/hrsh7th/nvim-cmp
--https://github.com/hrsh7th/cmp-nvim-lsp
-- https://github.com/hrsh7th/cmp-calc
-- https://github.com/hrsh7th/cmp-emoji
-- https://github.com/hrsh7th/cmp-cmdline
-- https://github.com/David-Kunz/cmp-npm
-- https://github.com/L3MON4D3/LuaSnip
-- https://github.com/saadparwaiz1/cmp_luasnip
-- https://github.com/rafamadriz/friendly-snippets

local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-calc",
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-cmdline",
    "David-Kunz/cmp-npm",
    {
      "L3MON4D3/LuaSnip",
      dependency = "rafamadriz/friendly-snippets",
      build = "make install_jsregexp",
      version = "<CurrentMajor>.*",
    },
    "saadparwaiz1/cmp_luasnip",
  },
  event = "InsertEnter",
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
    local luasnip = require "luasnip"
    local lspkind = require "lspkind"

    require("luasnip.loaders.from_vscode").lazy_load()
    return require("astronvim.utils").extend_tbl(opts, {
      snippet = {
        expand = function(args) require("luasnip").lsp_expand(args.body) end,
      },
      window = {
        completion = {
          border = "rounded",
          col_offset = 1,
          side_padding = 0,
        },
      },
      formatting = {
        format = lspkind.cmp_format {
          mode = "symbol",
          max_width = 50,
          symbol_map = { Copilot = "" },
        },
      },
      sources = cmp.config.sources {
        { name = "copilot", priority = 1100 },
        { name = "nvim_lsp", priority = 1000 },
        { name = "luasnip", priority = 750, option = { show_autosnippets = true } },
        { name = "buffer", priority = 500 },
        { name = "path", priority = 250 },
        { name = "npm", priority = 200, keyword_length = 4 },
        { name = "calc", priority = 150 },
        { name = "emoji", priority = 100 },
      },
      mapping = {
        ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
        ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
        ["<CR>"] = cmp.mapping.confirm { select = false, behavior = cmp.ConfirmBehavior.Replace },
        ["<C-e>"] = cmp.mapping.close(),
        ["<C-Space"] = cmp.mapping.complete(),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      },
    })
  end,
}

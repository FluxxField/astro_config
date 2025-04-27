---@type LazySpec
return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    format_on_save = {
      timeout_ms = 1000,
      lsp_fallback = false, -- Let conform fully handle it
    },
    formatters_by_ft = {
      javascript = { "biome-organize-imports", "biome" },
      javascriptreact = { "biome-organize-imports", "biome" },
      typescript = { "biome-organize-imports", "biome" },
      typescriptreact = { "biome-organize-imports", "biome" },
      go = { "goimports", "gofmt" },
      rust = { "rustfmt" },
      lua = { "stylua" },
    },
  },
}

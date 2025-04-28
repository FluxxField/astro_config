local languages = require "consts.language_packs"

local function build_formatters_by_ft()
  local formatters_by_ft = {}

  for filetype, lang in pairs(languages) do
    if lang.formatters then formatters_by_ft[filetype] = lang.formatters end
  end

  return formatters_by_ft
end

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
    formatters_by_ft = build_formatters_by_ft(),
  },
}

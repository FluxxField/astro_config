local languages = require "consts.language_packs"

local function collect_mason_packages()
  local mason_pkgs = {}
  local seen = {}

  for _, lang in pairs(languages) do
    for _, pkg in ipairs(lang.mason or {}) do
      if not seen[pkg] then
        table.insert(mason_pkgs, pkg)
        seen[pkg] = true
      end
    end
  end

  return mason_pkgs
end

---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = collect_mason_packages(),
    },
  },
}

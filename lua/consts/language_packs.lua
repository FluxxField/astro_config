---@alias LanguageValue table<string> | string | nil

---@cLass LanguageObject
---@fieLd mason LanguageValue
---@fieLd linters LanguageValue
---@fieLd servers LanguageValue
---@fieLd formatters LanguageValue
---@fieLd treesitter LanguageValue
---@fieLd telescope_extensions table<string, table> | string | nil

local M = {}

---@type LanguageObject
M.base = {
  servers = "vimls",
  treesitter = {
    "vim",
    "vimdoc",
    "regex",
    "query",
    "ini",
    "git_config",
    "gitignore",
    "gitattributes",
    "gitcommit",
    "kdl",
    "graphql",
    "http",
  },
}

---@type LanguageObject
M.markdown = {
  mason = { "marksman", "markdownlint" },
  servers = { "marksman" },
  linters = { "markdownlint" },
  treesitter = { "markdown", "markdown_inline" },
}

---@type LanguageObject
M.shell = {
  mason = { "bash-language-server", "shfmt", "shellcheck" },
  servers = { "bashls" },
  linters = { "shellcheck" },
  formatters = { "shfmt" },
  treesitter = { "bash" },
}

---@type LanguageObject
M.Lua = {
  mason = { "lua-language-server", "stylua", "selene" },
  servers = { "lua_ls" },
  formatters = { "stylua" },
  linters = { "selene" },
  treesitter = { "lua", "luadoc" },
}

---@type LanguageObject
M.javascript = {
  mason = { "vtsls", "biome", "html-lsp" },
  servers = { "vtsls", "html" },
  linters = { "oxlint", "biome" },
  formatters = { "biome", "biome-organize-imports" },
  treesitter = { "javascript", "typescript", "tsx", "html", "jsdoc" },
}

---@type LanguageObject
M.javascriptreact = {
  formatters = { "biome", "biome-organize-imports" },
}

---@type LanguageObject
M.typescript = {
  formatters = { "biome", "biome-organize-imports" },
}

---@type LanguageObject
M.typescriptreact = {
  formatters = { "biome", "biome-organize-imports" },
}

---@type LanguageObject
M.json = {
  mason = { "json-lsp", "biome" },
  servers = { "jsonls" },
  formatters = { "biome", "biome-organize-imports" },
  treesitter = { "json", "json5" },
}

---@type LanguageObject
M.docker = {
  mason = { "dockerfile-language-server", "docker-compose-language-service", "hadolint" },
  servers = { "dockerls", "docker_compose_language_service" },
  linters = { "hadolint" },
  treesitter = { "dockerfile" },
}

---@type LanguageObject
M.go = {
  mason = { "gopls", "gomodifytags", "gotests", "iferr", "impl" },
  servers = { "gopls" },
  formatters = { "goimports", "gofmt" },
  treesitter = { "go", "gomod", "gosum" },
}

---@type LanguageObject
M.rust = {
  mason = { "rust-analyzer", "codelldb" },
  servers = { "rust-analyzer" },
  formatters = { "rustfmt" },
  treesitter = { "rust" },
}

---@type LanguageObject
M.sql = {
  mason = { "sqlls" },
  servers = { "sqlls" },
  treesitter = { "sql" },
}

---@type LanguageObject
M.yaml = {
  mason = { "yaml-language-server" },
  servers = { "yamlls" },
  treesitter = { "yaml" },
}

---@type LanguageObject
M.css = {
  mason = { "css-lsp", "stylelint" },
  servers = { "cssls" },
  linters = { "stylelint" },
  treesitter = { "css", "scss" },
}

---@type LanguageObject
M.tailwindcss = {
  mason = { "tailwindcss-language-server" },
  servers = { "tailwindcss" },
}

return M

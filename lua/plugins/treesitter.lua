---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    auto_install = true,
    ensure_installed = {
      -- Core languages
      "lua",
      "vim",
      "vimdoc",
      "bash",
      "markdown",
      "markdown_inline",

      -- Web Development
      "html",
      "css",
      "scss",
      "jsdoc",
      "javascript",
      "typescript",
      "tsx",
      "json",
      "json5",
      "yaml",
      "toml",
      "graphql",
      "http",

      -- Config/dotfile formats
      "ini",
      "dockerfile",
      "git_config",
      "gitignore",
      "gitattributes",
      "gitcommit",

      -- Programming Languages
      "rust",
      "go",
      "gomod",
      "gowork",
      "gosum",

      -- SQL & Databases
      "sql",

      -- Other formats
      "kdl",
      "regex",
      "query",
    },
  },
}

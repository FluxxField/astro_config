-- https://github.com/nvim-treesitter/nvim-treesitter

return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { 
    "windwp/nvim-ts-autotag",
    "JoosepAlviste/nvim-ts-context-commentstring",
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  event = "User AstroFile",
  cmd = {
    "TSBufDisable",
    "TSBufEnable",
    "TSBufToggle",
    "TSDisable",
    "TSEnable",
    "TSToggle",
    "TSInstall",
    "TSInstallInfo",
    "TSInstallSync",
    "TSModuleInfo",
    "TSUninstall",
    "TSUpdate",
    "TSUpdateSync",
  },
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "comment",
      "css",
      "git_config",
      "git_rebase",
      "gitcommit",
      "gitignore",
      "html",
      "javascript",
      "jsdoc",
      "json",
      "json5",
      "lua",
      "luadoc",
      "regex",
      "rust",
      "scss",
      "sql",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "yaml",
      "query"
    },
  },
  config = function(plugin, opts)
    require("plugins.configs.nvim-treesitter")(plugin, opts)
  end,
}

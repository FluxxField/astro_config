---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
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
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
          ["ao"] = "@object.outer",
          ["io"] = "@object.inner",
          ["ak"] = "@key.outer",
          ["ik"] = "@key.inner",
          ["av"] = "@value.outer",
          ["iv"] = "@value.inner",
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["at"] = "@jsx.outer",
          ["it"] = "@jsx.inner",
        },
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          ["]f"] = "@function.outer",
          ["]a"] = "@parameter.outer",
          ["]t"] = "@jsx.outer",
        },
        goto_previous_start = {
          ["[f"] = "@function.outer",
          ["[a"] = "@parameter.outer",
          ["[t"] = "@jsx.outer",
        },
      },
      swap = {
        enable = true,
        swap_next = {
          [">a"] = "@parameter.inner",
        },
        swap_previous = {
          ["<a"] = "@parameter.inner",
        },
      },
    },
  },
}

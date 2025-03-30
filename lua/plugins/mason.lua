---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        "gopls",
        "tailwindcss-language-server",
        "rust-analyzer",
        "lua-language-server",
        "css-lsp",
        "emmet-ls",
        "eslint-lsp",
        "html-lsp",
        "json-lsp",
        "sqlls",
        "taplo",
        "vtsls",
        "oxlint",
        "biome",

        -- install formatters
        "stylua",
        "prettierd",

        -- install debuggers
        "cpptools",
        "codelldb",
        "js-debug-adapter",
        "bash-debug-adapter",

        -- Install Linters
        "stylelint",
        "eslint_d",
        "selene",

        -- install any other package
        "tree-sitter-cli",
      },
    },
  },
}

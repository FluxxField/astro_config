return {
  "simrat39/rust-tools.nvim",
  cond = function() return require("user/customize").rust_tools end,
  opts = {
    ensure_installed = "rust_analyzer",
    on_attach = function(_, bufnr)
      vim.keymap.set("n", "<C-space>", require("rust-tools").hover_actions.hover_actions, { buffer = bufnr })
    end,
  },
}

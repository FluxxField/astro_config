---@type LazySpec
return {
  "lsp_lines.nvim",
  dependiencies = {
    {
      "AstroNvim/astrocore",
      ---@type AstroCoreOpts
      opts = {
        diagnostics = {
          virtual_text = false,
          virtual_lines = false,
          signs = true,
          underline = true,
        },
      },
    }
  },
}

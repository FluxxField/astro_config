local function has_config(files)
  local cwd = vim.fn.getcwd()

  for _, file in ipairs(files) do
    local path = cwd .. "/" .. file

    if vim.loop.fs_stat(path) then return true end
  end

  return false
end

local function has_exec(bin) return vim.fn.executable(bin) == 1 end

local enabled = {
  ["FluxxField/bionic-reading.nvim"] = true,
  ["saghen/blink.cmp"] = true,
  ["stevearc/conform.nvim"] = true,
  ["rebelot/kanagawa.nvim"] = true,
  ["lsp_lines.nvim"] = true,
  ["WhoIsSethDaniel/mason-tool-installer.nvim"] = true,
  ["nvim-neo-tree/neo-tree.nvim"] = true,
  ["nvimtools/none-ls.nvim"] = true,
  ["nvimtools/none-ls-extras.nvim"] = true,
  ["stevearc/oil.nvim"] = true,
  ["nvim-tree/nvim-web-devicons"] = true,
  ["FluxxField/smart-motion.nvim"] = true,
  ["kylechui/nvim-surround"] = true,
  ["luckasRanarison/tailwind-tools.nvim"] = true and has_config { "tailwind-config.ts", "tailwind-config.js" },
  ["nvim-treesitter/nvim-treesitter"] = true,
  ["nvim-treesitter/nvim-treesitter-textobjects"] = true,
  ["Wansmer/treesj"] = true,
  ["ts-error-translator.nvim"] = true and has_config { "tsconfig.json" },
  ["ckolkey/ts-node-action"] = true,
  ["swaits/zellij-nav.nvim"] = true and has_exec "zellij",
  ["dmmulroy/tsc.nvim"] = true and has_config { "tsconfig.json" },
}

local specs = {}

for plugin, cond in pairs(enabled) do
  table.insert(specs, { plugin, cond = cond })
end

return specs

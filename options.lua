-- rtx where uses .rtx.toml to find the path to the right version of node
-- if we update node, we need to run rtx where nodejs to get the new path
local handle = io.popen "mise where nodejs"
local nodejs_path = ""

if handle then
  nodejs_path = handle:read "*a"
  handle:close()
end

-- set vim options here (vim.<first_key>.<second_key> = value)
return {
  env = {
    PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH,
  },
  opt = {
    -- set to true or false etc.
    relativenumber = true, -- sets vim.opt.relativenumber
    number = true, -- sets vim.opt.number
    spell = false, -- sets vim.opt.spell
    signcolumn = "auto", -- sets vim.opt.signcolumn to auto
    wrap = true, -- sets vim.opt.wrap
    scrolloff = 999, -- sets vim.opt.scrolloff
    linebreak = true, -- sets vim.opt.linebreak
    completeopt = { "menu", "menuone", "preview", "noinsert" }, -- sets vim.opt.completeopt
  },
  g = {
    copilot_node_command = nodejs_path,
    mapleader = " ", -- sets vim.g.mapleader
    autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
    cmp_enabled = true, -- enable completion at start
    autopairs_enabled = true, -- enable autopairs at start
    diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
    icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
    ui_notifications_enabled = true, -- disable notifications when toggling UI elements
    transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, { "CursorLine" }),
    clipboard = {
      name = "WslClipboard",
      copy = {
        ["+"] = "clip.exe",
        ["*"] = "clip.exe",
      },
      paste = {
        ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      },
      cache_enabled = 0,
    },
  },
}
-- If you need more control, you can use the function()...end notation
-- return function(local_vim)
--   local_vim.opt.relativenumber = true
--   local_vim.g.mapleader = " "
--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
--
--   return local_vim
-- end

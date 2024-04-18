return {
  "ggandor/flit.nvim",
  dependiences = { "ggandor/leap.nvim", "tpope/vim-repeat" },
  cond = function() return require("user/customize").flit end,
  keys = function()
    local ret = {}

    for _, key in ipairs { "f", "F", "t", "T" } do
      ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = "Flit " .. key }
    end

    return ret
  end,
  opts = {
    label_modes = "nv",
    keys = { "f", "F", "t", "T" },
    multiline = true,
  },
  config = function(_, opts) require("flit").setup(opts) end,
}

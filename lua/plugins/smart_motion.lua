---@type LazySpec
return {
  "FluxxField/smart-motion.nvim",
  event = { "VeryLazy" },
  dir = "~/github/smart-motion.nvim",
  ---@module 'smart-motion.nvim'
  ---@type SmartMotionConfig
  opts = {
    use_background_highlights = false,
    auto_select_target = true,
    presets = {
      words = true,
      lines = true,
      search = true,
      delete = true,
      yank = true,
      change = true,
      misc = true,
    },
  },
}

---@type LazySpec
return {
  "FluxxField/smart-motion.nvim",
  event = { "VeryLazy" },
  dir = "~/github/smart-motion.nvim",
  ---@module 'smart-motion.nvim'
  ---@type SmartMotionConfig
  opts = {
    use_background_highlights = false,
    presets = {
      words = true,
      lines = true,
      search = true,
      delete = true,
      yank = true,
      change = true,
    },
  },
}

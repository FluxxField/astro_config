---@type LazySpec
return {
  "FluxxField/smart-motion.nvim",
  dir = "~/github/smart-motion.nvim",
  ---@module 'smart-motion.nvim'
  ---@type SmartMotionConfig
  opts = {
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

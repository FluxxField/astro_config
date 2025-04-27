---@type LazySpec
return {
  "FluxxField/smart-motion.nvim",
  dir = "~/github/smart-motion.nvim",
  ---@type SmartMotion.SetupOpts
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

-- https://github.com/michaelb/sniprun

return {
  "michaelb/sniprun",
  cmd = { "SnipRun", "SnipInfo", "SnipReset", "SnipClose", "SnipLive" },
  build = "bash ./install.sh",
  config = function(_, opts) require("sniprun").setup(opts) end,
  opts = {
    live_mode_toggle = "enable",
    display = {
      "TempFloatingWindow",
    },
    live_display = {
      "TempFloatingWindow",
    },
    show_no_output = {
      "TempFloatingWindow",
    },
  },
}

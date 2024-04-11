return {
  "FluxxField/bionic-reading.nvim",
  event = { "User AstroFile" },
  cond = function() return require("user/customize").bionic_reading end,
  config = function()
    require("bionic-reading").setup {
      auto_highlight = true,
      file_types = {
        ["text"] = "any",
        ["lua"] = {
          "comment",
        },
        ["javascript"] = {
          "comment",
        },
        ["javascriptreact"] = {
          "comment",
        },
        ["typescript"] = {
          "comment",
        },
        ["typescriptreact"] = {
          "comment",
        },
      },
      hl_group_value = {
        bold = true,
      },
      prompt_user = true,
      treesitter = true,
      update_in_insert_mode = true,
    }
  end,
}

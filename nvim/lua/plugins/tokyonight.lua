-- Color-scheme
return {
  "folke/tokyonight.nvim",
  event = "UIEnter",
  config = function()
    require "config.tokyonight"
  end,
}

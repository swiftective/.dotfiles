return {
  "nvim-neorg/neorg",
  dependencies = { "nvim-lua/plenary.nvim" },
  version = "v7.0.0", -- This is the important part!
  event = "VeryLazy",
  config = function()
    require "config.norg"
  end,
}

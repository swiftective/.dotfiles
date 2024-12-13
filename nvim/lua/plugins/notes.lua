return {

  {
    "nvim-neorg/neorg",
    dependencies = { "nvim-lua/plenary.nvim" },
    version = "v7.0.0", -- This is the important part!
    event = "VeryLazy",
    config = function()
      require "config.norg"
    end,
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
    opts = {

      anti_conceal = {
        enabled = false,
      },

      heading = {
        icons = { "❖ ", "❖ ", "❖ ", "◈ ", "◆ ", "◇ " },
        backgrounds = { "" },
      },

      checkbox = {
        checked = { icon = " ", scope_highlight = "@markup.strikethrough" },
        unchecked = { icon = " " },
        custom = { todo = { rendered = " " } },
      },

      sign = {
        enabled = false,
      },

      bullet = {
        icons = { "-" },
      },
    },
  },
}

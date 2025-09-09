return {

  { "tpope/vim-fugitive", cmd = "Git" },

  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    config = function()
      require "config.gitsigns"
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

}

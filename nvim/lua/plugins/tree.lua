return {
  -- undotree
  { "mbbill/undotree", cmd = "UndotreeToggle" },

  {
    "stevearc/oil.nvim",
    lazy = true,
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      float = {
        border = "rounded",
        padding = 10,
      },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
}

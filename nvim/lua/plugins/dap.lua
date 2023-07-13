return {
  -- Debugging
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    config = function()
      require "config.dap"
    end,
    dependencies = {
      {
        "theHamsta/nvim-dap-virtual-text",
        config = true,
      },
    },
  },

  {
    "rcarriga/nvim-dap-ui",
    lazy = true,
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require "config.dapui"
    end,
  },

  {
    "nvim-telescope/telescope-dap.nvim",
    lazy = true,
    after = "nvim-dap",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("telescope").load_extension "dap"
    end,
  },

  {
    "David-Kunz/jester",
    dependencies = "mfussenegger/nvim-dap",
    lazy = true,
  },
}

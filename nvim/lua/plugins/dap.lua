return {
  -- Debugging
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    config = function()
      require "swft.dap"
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
      require("dapui").setup {
        icons = { expanded = "▾", collapsed = "▸" },
        mappings = {
          expand = { "<CR>", "<2-LeftMouse>" },
          open = "o",
          remove = "d",
          edit = "e",
          repl = "r",
          toggle = "t",
        },
        expand_lines = vim.fn.has "nvim-0.7",
        layouts = {
          {
            elements = {

              { id = "scopes", size = 0.25 },
              "breakpoints",
              "stacks",
              "watches",
            },
            size = 40,
            position = "left",
          },
          {
            elements = {
              "repl",
              "console",
            },
            size = 10,
            position = "bottom",
          },
        },
        floating = {
          max_height = nil,
          max_width = nil,
          border = "single",
          mappings = {
            close = { "q", "<Esc>" },
          },
        },
        windows = { indent = 1 },
        render = {
          max_type_length = nil,
        },
      }
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

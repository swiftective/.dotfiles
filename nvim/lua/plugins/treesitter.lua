return {

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        rainbow = {
          enable = true,
          disable = { "html" },
          extended_mode = true,
          max_file_lines = nil,
        },
        highlight = {
          enable = true,
          disable = { "html" },
          extended_mode = true,
          max_file_lines = nil,
        },
        indent = {
          enable = true,
        },
      }
    end,
    dependencies = {
      "p00f/nvim-ts-rainbow",
    },
  },
  { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle", dependencies = "nvim-treesitter/nvim-treesitter" },
}

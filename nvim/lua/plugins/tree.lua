return {
  -- undotree
  { "mbbill/undotree", cmd = "UndotreeToggle" },

  -- file tree
  {
    "kyazdani42/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    config = function()
      require "config.nvimtree"
    end,
  },
}

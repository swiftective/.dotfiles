return {
  -- undotree
  { "mbbill/undotree", cmd = "UndotreeToggle" },

  -- file tree
  {
    "nvim-tree/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    config = function()
      require "config.nvimtree"
    end,
  },
}

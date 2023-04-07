return {
  "akinsho/flutter-tools.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  ft = "dart",
  config = function()
    require("flutter-tools").setup {
      dev_log = {
        open_cmd = "edit",
      },
    } -- use defaults
    require("telescope").load_extension "flutter"
    require("luasnip").filetype_extend("dart", { "flutter" })
  end,
}

require("telescope").setup {
  defaults = {
    file_sorter = require("telescope.sorters").get_fzy_sorter,
    prompt_prefix = " 🔍 ",
    color_devicons = true,
  },
  extensions = {
    extension_name = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      },
    },
  },
}

require("telescope").load_extension "fzy_native"

require("telescope").load_extension "git_worktree"

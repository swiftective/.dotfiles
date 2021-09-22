require('telescope').setup{
  defaults = {
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        prompt_prefix = " 🔍 ",
        color_devicons = true,

        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    extension_name = {
     fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      }
    }
  }
}

require('telescope').load_extension('fzy_native')

require("telescope").load_extension("git_worktree")


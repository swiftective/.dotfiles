local actions = require "telescope.actions"

local previewers = require "telescope.previewers"
local Job = require "plenary.job"

local new_maker = function(filepath, bufnr, opts)
  opts = opts or {}

  filepath = vim.fn.expand(filepath)
  vim.loop.fs_stat(filepath, function(_, stat)
    if not stat then
      return
    end
    if stat.size > 100000 then
      return
    else
      previewers.buffer_previewer_maker(filepath, bufnr, opts)
    end
  end)
  Job
    :new({
      command = "file",
      args = { "--mime-type", "-b", filepath },
      on_exit = function(j)
        local mime_type = vim.split(j:result()[1], "/")[1]
        if mime_type == "text" then
          previewers.buffer_previewer_maker(filepath, bufnr, opts)
        else
          -- maybe we want to write something to the buffer here
          vim.schedule(function()
            vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
          end)
        end
      end,
    })
    :sync()
end

require("telescope").setup {
  defaults = {
    file_sorter = require("telescope.sorters").get_fzy_sorter,
    prompt_prefix = " 🔍 ",
    color_devicons = true,
    buffer_previewer_maker = new_maker,
    layout_config = {
      horizontal = { width = 150 },
    },
    mappings = {
      n = {
        ["<C-x>"] = false,
        ["<C-q>"] = actions.send_to_qflist,
        ["<C-f>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,
      },
      i = {
        ["<C-x>"] = false,
        ["<C-q>"] = actions.send_to_qflist,
        ["<C-f>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,
      },
    },
  },
  extensions = {
    extension_name = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      },
    },
  },
}

local M = {}

M.project_files = function()
  local opts = {} -- define here if you want to define something
  local ok = pcall(require("telescope.builtin").git_files, opts)
  if not ok then
    require("telescope.builtin").fd(opts)
  end
end

return M

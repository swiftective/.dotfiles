local group = vim.api.nvim_create_augroup("swiftective", { clear = true })

local create_autocmd = function(autocmds)
  for _, autocmd in ipairs(autocmds) do
    local event = autocmd.event
    autocmd.event = nil
    vim.api.nvim_create_autocmd(event, autocmd)
  end
end

local autocmds = {

  {
    event = "InsertLeave",
    callback = function()
      vim.cmd "norm! m'"
    end,
    pattern = "*",
    group = group,
  },

  {
    event = "InsertEnter",
    callback = function()
      vim.schedule(function()
        vim.cmd "nohl"
      end)
    end,
    pattern = "*",
    group = group,
  },

  {
    event = "TextYankPost",
    callback = function()
      require("vim.hl").on_yank { timeout = 60 }
    end,
    pattern = "*",
    group = group,
  },

  { event = "TermOpen", command = "setlocal nonumber norelativenumber", pattern = "*", group = group },

  {
    event = "FileType",
    pattern = "fugitive",
    group = group,
    callback = function()
      vim.api.nvim_buf_set_keymap(0, "n", "<Tab>", "=", { noremap = false })
    end,
  },

  { event = "BufWritePre", pattern = "*", command = "%s/\\s\\+$//e", group = group },

  {
    event = "BufLeave",
    pattern = "*",
    group = group,
    callback = function()
      local buffers = vim.api.nvim_list_bufs()

      for _, v in ipairs(buffers) do
        local ft = vim.api.nvim_get_option_value("filetype", { buf = v })
        if ft == "fugitive" then
          vim.api.nvim_buf_delete(v, {})
        end
      end
    end,
  },
}

create_autocmd(autocmds)

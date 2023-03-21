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
    event = "InsertEnter",
    callback = function()
      vim.schedule(function()
        vim.cmd "nohl"
      end)
    end,
    pattern = "*",
    group = group,
  },

  { event = "FileType", command = "set filetype=sh", pattern = "zsh", group = group },

  {
    event = "TextYankPost",
    callback = function()
      require("vim.highlight").on_yank { timeout = 60 }
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

  { event = "BUfWritePre", pattern = "*", command = "%s/\\s\\+$//e", group = group },

  {
    event = "BufWritePre",
    pattern = "*.lua",
    group = group,
    callback = function()
      vim.lsp.buf.format { async = true }
    end,
  },
}

create_autocmd(autocmds)

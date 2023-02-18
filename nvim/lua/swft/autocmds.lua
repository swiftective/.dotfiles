local group = vim.api.nvim_create_augroup("swiftective", { clear = true })

local create_autocmd = function(table)
  for _, v in ipairs(table) do
    vim.api.nvim_create_autocmd(v.event, {
      command = v.command,
      pattern = v.pattern,
      group = v.group,
      callback = v.callback,
    })
  end
end

local autocmds = {
  { event = "FileType", command = "set filetype=sh",                    pattern = "zsh", group = group },

  {
    event = "TextYankPost",
    callback = function()
      require("vim.highlight").on_yank { timeout = 60 }
    end,
    pattern = "*",
    group = group,
  },

  { event = "TermOpen", command = "setlocal nonumber norelativenumber", pattern = "*",   group = group },

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
      vim.lsp.buf.format()
    end,
  },
}

create_autocmd(autocmds)

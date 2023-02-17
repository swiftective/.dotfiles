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
  { event = "FileType",    command = "set filetype=sh", pattern = "zsh", group = group },
  { event = "ColorScheme", callback = "Colord",         pattern = "*",   group = group },

  {
    event = "TextYankPost",
    callback = function()
      require("vim.highlight").on_yank { timeout = 60 }
    end,
    pattern = "*",
    group = group,
  },

  { event = "TermOpen",    command = "setlocal nonumber norelativenumber", pattern = "*",             group = group },

  {
    event = "FileType",
    pattern = "fugitive",
    group = group,
    callback = function()
      vim.api.nvim_buf_set_keymap(0, "n", "<Tab>", "=", { noremap = false })
    end,
  },

  { event = "BUfWritePre", pattern = "*",                                  command = "%s/\\s\\+$//e", group = group },

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

Swft = {}
Swft.HandleURL = function()
  local url = string.match(vim.fn.getline ".", "[a-z]*://[^ >,;]*")
  if url ~= nil then
    vim.fn.system(string.format("xdg-open %s", url))
  else
    vim.notify(" No URI found in line. ", "error", { title = debug.getinfo(1, "n").name })
  end
end

Swft.FugitiveToggle = function()
  local win = vim.api.nvim_list_wins()

  for _, v in ipairs(win) do
    if pcall(vim.api.nvim_win_get_var, v, "fugitive_status") then
      vim.api.nvim_win_close(v, false)
      return
    end
  end

  vim.cmd [[Git]]
end

Swft.ToggleLualine = function()
  local lualine = require "lualine"
  if vim.o.statusline == "%#Normal#" then
    lualine.hide { unhide = true }
    return
  end
  lualine.hide()
end

return Swft

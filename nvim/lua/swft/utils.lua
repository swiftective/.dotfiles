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
  if vim.o.statusline == " " then
    lualine.hide { unhide = true }
    return
  end
  lualine.hide()
end

Swft.project_files = function()
  local opts = {} -- define here if you want to define something
  local ok = pcall(require("telescope.builtin").git_files, opts)
  if not ok then
    require("telescope.builtin").find_files(opts)
  end
end

local function preview_location_callback(_, result)
  if result == nil or vim.tbl_isempty(result) then
    return nil
  end
  vim.lsp.util.preview_location(result[1])
end

Swft.PeekDefinition = function()
  local params = vim.lsp.util.make_position_params()
  return vim.lsp.buf_request(0, "textDocument/definition", params, preview_location_callback)
end

Swft.ColorBracket = function()
  local buf_ft = vim.bo.filetype

  local filetypes = { "javascriptreact", "typescriptreact", "html", "javascript", "svelte" }

  for _, ft in ipairs(filetypes) do
    if ft == buf_ft then
      return
    end
  end

  vim.cmd "TSBufDisable rainbow"
  vim.cmd "TSBufEnable  rainbow"
end

return Swft

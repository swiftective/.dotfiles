M = {}

M.handle_url = function()
  local url = string.match(vim.fn.getline ".", "[a-z]*://[^ >,;]*")
  if url ~= nil then
    vim.fn.system(string.format("xdg-open %s", url))
  else
    vim.notify(" No URI found in line. ", "error", { title = debug.getinfo(1, "n").name })
  end
end

M.fugitive_toggle = function()
  local win = vim.api.nvim_list_wins()

  for _, v in ipairs(win) do
    if pcall(vim.api.nvim_win_get_var, v, "fugitive_status") then
      vim.api.nvim_win_close(v, false)
      return
    end
  end

  vim.cmd [[Git]]
end

M.toggle_lualine = function()
  local lualine = require "lualine"
  if vim.o.statusline == " " then
    lualine.hide { unhide = true }
    return
  end
  lualine.hide()
end

M.project_files = function()
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

M.peek_definition = function()
  local params = vim.lsp.util.make_position_params()
  return vim.lsp.buf_request(0, "textDocument/definition", params, preview_location_callback)
end

M.project_outline = function()
  local filepath = "~/notes/projects/"
  local filename = vim.fn.system({ "tmux", "display-message", "-p", "#S" }):gsub("\n[^\n]*$", "") .. ".md"
  vim.cmd("e " .. filepath .. filename)
end

M.custom_keymaps = function(keymaps)
  for _, value in ipairs(keymaps) do
    local opts = {}
    if value.opts then
      value.opts.desc = value[4]
      opts = value.opts
    else
      opts = { noremap = true, silent = true, desc = value[4] }
    end
    vim.keymap.set(value[1], value[2], value[3], opts)
  end
end

local get_non_floating_windows = function()
  local wins = vim.api.nvim_list_wins()
  local result = {}

  for _, win in ipairs(wins) do
    local cfg = vim.api.nvim_win_get_config(win)
    if cfg.relative == "" then -- "" means normal (non-floating) window
      table.insert(result, win)
    end
  end

  return result
end

M.maximize_win = function()
  local curr_win = vim.fn.winnr()
  local wins = get_non_floating_windows()
  local zen_width = 100

  if #wins > 2 then
    local increment = math.floor((vim.o.columns - zen_width) / (#wins - 1))

    for i, v in ipairs(wins) do
      if i == curr_win then
        vim.api.nvim_win_set_width(v, zen_width)
      else
        vim.api.nvim_win_set_width(v, increment)
      end
    end
  end
end

return M

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
    event = "FileType",
    callback = function()
      vim.keymap.set("n", "m", function()
        local line = vim.fn.getcharstr(0)
        if line == "" then
          return
        end

        local keys = {
          f = 1,
          d = 2,
          s = 3,
          a = 4,
          j = 5,
          k = 6,
          l = 7,
        }

        if line == ";" then
          line = string.format(8)
        end

        if keys[line] then
          line = string.format(keys[line])
        end

        local line_number = tonumber(line)
        if line_number and line_number ~= 0 then
          local currentline = vim.api.nvim_win_get_cursor(0)[1]
          if currentline > line_number then
            line = string.format(line_number - 1)
          end
        end

        ---@diagnostic disable-next-line: param-type-mismatch
        if not pcall(vim.cmd, "m" .. line) then
          vim.notify "Invalid line number"
        end
      end, {
        noremap = true,
        buffer = true,
      })
    end,
    pattern = "harpoon",
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

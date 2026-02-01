local group = vim.api.nvim_create_augroup("swiftective", { clear = true })

local create_autocmd = function(autocmds)
  for _, autocmd in ipairs(autocmds) do
    local event = autocmd.event
    autocmd.event = nil
    vim.api.nvim_create_autocmd(event, autocmd)
  end
end

local initialized_clients = {}

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
    event = "LspAttach",
    group = group,
    pattern = "*",
    callback = function(ev)
      local client_id = ev.data.client_id

      if initialized_clients[client_id] then
        return
      end

      initialized_clients[client_id] = true

      vim.defer_fn(function()
        local clients = vim.lsp.get_clients { bufnr = 0 }
        if #clients == 0 then
          return
        end

        local devicons = require "nvim-web-devicons"
        local buf_ft = vim.bo.filetype

        local parts = {}

        for _, client in ipairs(clients) do
          local icon = "[LSP]" -- fallback

          -- Try to get a language icon via filetype
          local devicon = devicons.get_icon_by_filetype(buf_ft, { default = false })
          if devicon then
            icon = devicon
          end

          table.insert(parts, string.format("%s %s", icon, client.name))
        end

        require("fidget").notify(table.concat(parts, ", "), nil, {
          title = "LSP Active",
          key = "lsp_attach_notify",
          annote = nil,
          ttl = 2,
        })
      end, 500)
    end,
  },
}

create_autocmd(autocmds)

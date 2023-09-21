require("neorg").setup {
  load = {
    ["core.defaults"] = {}, -- Loads default behaviour
    ["core.keybinds"] = {
      config = {
        default_keybinds = true,
      },
    },
    ["core.concealer"] = {
      config = {
        icon_preset = "diamond",
        icons = {
          todo = {
            cancelled = false,
            done = {
              icon = "󰄬",
            },
            on_hold = false,
            pending = false,
            recurring = false,
            uncertain = false,
            undone = false,
            urgent = false,
          },
        },
      },
    }, -- Adds pretty icons to your documents
    ["core.dirman"] = { -- Manages Neorg workspaces
      config = {
        workspaces = {
          notes = "~/notes",
        },
      },
    },
  },
}

vim.cmd "hi @neorg.todo_items.done guifg=cyan"

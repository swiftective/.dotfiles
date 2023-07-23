-- ╭━╮╱╱╭┳━┳╮╱╱╱╱╭╮╭╮
-- ┃━╋┳┳╋┫━┫╰┳━┳━┫╰╋╋━┳━┳━╮
-- ┣━┃┃┃┃┃╭┫╭┫┻┫━┫╭┫┣╮┃╭┫┻┫
-- ╰━┻━━┻┻╯╰━┻━┻━┻━┻╯╰━╯╰━╯

if require "swft.first_load"() then
  return
end

require "swft.options"

local opts = {
  change_detection = {
    enabled = false,
  },
  ui = {
    border = "rounded",
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "gzip",
        "zip",
        "zipPlugin",
        "getscript",
        "getscriptPlugin",
        "vimball",
        "vimballPlugin",
        "2html_plugin",
        "logipat",
        "rrhelper",
        "spellfile_plugin",
        "matchit",
        "tarPlugin",
        "tohtml",
        "health",
        "tutor",
        "man",
      },
    },
  },
}

require("lazy").setup("plugins", opts) -- Package Manager

require "swft.keymaps"
require "swft.autocmds"
require "swft.utils"

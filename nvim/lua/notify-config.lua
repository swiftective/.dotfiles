vim.notify = require "notify"

-- local async = require "plenary.async"
-- local notify = require("notify").async
--
-- async.run(function()
--   notify("Let's wait for this to close").close()
--   notify "It closed!"
-- end)

require("notify").setup {
  stages = "fade_in_slide_out",
  on_open = nil,
  render = "default",
  timeout = 5000,
  background_colour = "#000000",
  minimum_width = 50,
  icons = {
    ERROR = "",
    WARN = "",
    INFO = "",
    DEBUG = "",
    TRACE = "✎",
  },
}

require "stylua"

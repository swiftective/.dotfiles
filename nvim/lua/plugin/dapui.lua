require("dapui").setup {
  sidebar = {
    elements = {
      {
        id = "scopes",
        size = 0.20, -- Can be float or integer > 1
      },
      { id = "breakpoints", size = 0.20 },
      { id = "stacks", size = 0.30 },
      { id = "watches", size = 0.20 },
    },
    size = 15,
    position = "bottom", -- Can be "left", "right", "top", "bottom"
  },
  tray = {
    elements = { "repl" },
    size = 50,
    position = "right", -- Can be "left", "right", "top", "bottom"
  },
  floating = {
    max_height = 0.3, -- These can be integers or a float between 0 and 1.
    max_width = 0.3, -- Floats will be treated as percentage of your screen.
    border = "rounded", -- Border style. Can be "single", "double" or "rounded"
  },
  windows = { indent = 0 },
}

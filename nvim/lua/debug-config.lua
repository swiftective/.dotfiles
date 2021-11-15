require("telescope").load_extension "dap"
require("nvim-dap-virtual-text").setup()
require("dap.ext.vscode").load_launchjs()

local dap = require "dap"
dap.defaults.fallback.terminal_win_cmd = "60vsplit new"

-- dap.configurations.typescript = { -- change to typescript if needed
--   {
--     type = "chrome",
--     request = "attach",
--     program = "${file}",
--     cwd = vim.fn.getcwd(),
--     sourceMaps = true,
--     protocol = "inspector",
--     port = 9222,
--     webRoot = "${workspaceFolder}",
--   },
-- }

local dap_install = require "dap-install"
dap_install.config("jsnode", {})
dap_install.config("python", {})
dap_install.config("chrome", {})

-- local dap = require "dap"
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "LspDiagnosticsSignError", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "LspDiagnosticsSignHint", numhl = "" })
vim.fn.sign_define(
  "DapBreakpointCondition",
  { text = "", texthl = "LspDiagnosticsSignWarning", linehl = "", numhl = "" }
)
vim.fn.sign_define(
  "DapBreakpointRejected",
  { text = "", texthl = "LspDiagnosticsSignWarning", linehl = "", numhl = "" }
)
vim.fn.sign_define("DapLogPoint", { text = "", texthl = "LspDiagnosticsSignHint", linehl = "", numhl = "" })

require("dapui").setup {
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
  },
  sidebar = {
    elements = {
      {
        id = "scopes",
        size = 0.20, -- Can be float or integer > 1
      },
      { id = "breakpoints", size = 0.20 },
      { id = "stacks", size = 0.20 },
      { id = "watches", size = 0.20 },
    },
    size = 20,
    position = "bottom", -- Can be "left", "right", "top", "bottom"
  },
  tray = {
    elements = { "repl" },
    size = 50,
    position = "right", -- Can be "left", "right", "top", "bottom"
  },
  floating = {
    max_height = 0.5, -- These can be integers or a float between 0 and 1.
    max_width = 0.5, -- Floats will be treated as percentage of your screen.
    border = "double", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 0 },
}

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<leader>dc", '<cmd>lua require"dap".continue()<CR>', opts)
map("n", "<leader>dsv", '<cmd>lua require"dap".step_over()<CR>', opts)
map("n", "<leader>dsi", '<cmd>lua require"dap".step_into()<CR>', opts)
map("n", "<leader>dso", '<cmd>lua require"dap".step_out()<CR>', opts)
map("n", "<leader>dsb", '<cmd>lua require"dap".step_back()<CR>', opts)
map("n", "<leader>djd", '<cmd>lua require"jester".debug({ path_to_jest = "../node_modules/.bin/jest" })<CR>', opts)
map("n", "<leader>dbt", '<cmd>lua require"dap".toggle_breakpoint()<CR>', opts)
map("n", "<leader>dbc", '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', opts)
map("n", "<leader>dbm", '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', opts)
map("n", "<leader>dro", '<cmd>lua require"dap".repl.open()<CR>', opts)
map("n", "<leader>drl", '<cmd>lua require"dap".repl.run_last()<CR>', opts)

-- telescope-dap
map("n", "<leader>dtc", '<cmd>lua require"telescope".extensions.dap.commands{}<CR>', opts)
map("n", "<leader>dts", '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>', opts)
map("n", "<leader>dtb", '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>', opts)
map("n", "<leader>dtv", '<cmd>lua require"telescope".extensions.dap.variables{}<CR>', opts)
map("n", "<leader>dtf", '<cmd>lua require"telescope".extensions.dap.frames{}<CR>', opts)
map("n", "<leader>dui", '<cmd>lua require("dapui").toggle()<CR>', opts)

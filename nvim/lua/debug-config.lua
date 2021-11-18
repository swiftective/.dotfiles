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

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<leader>dcc", '<cmd>lua require"dap".continue()<CR>', opts)
map("n", "<leader>dcr", '<cmd>lua require"dap".reverse_continue()<CR>', opts)
map("n", "<leader>dv", '<cmd>lua require"dap".step_over()<CR>', opts)
map("n", "<leader>di", '<cmd>lua require"dap".step_into()<CR>', opts)
map("n", "<leader>do", '<cmd>lua require"dap".step_out()<CR>', opts)
map("n", "<leader>dsb", '<cmd>lua require"dap".step_back()<CR>', opts)
map("n", "<leader>dk", '<cmd>lua require"dap".up()<CR>', opts)
map("n", "<leader>dj", '<cmd>lua require"dap".down()<CR>', opts)
map("n", "<leader>dbt", '<cmd>lua require"dap".toggle_breakpoint()<CR>', opts)
map("n", "<leader>dbc", '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', opts)
map("n", "<leader>dbm", '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', opts)
map("n", "<leader>dbe", ':lua require"dap".set_exception_breakpoints({"all"})<CR>', opts)
map("n", "<leader>drt", ':lua require"dap".repl.toggle({}, "40vsplit")<CR>', opts)
map("n", "<leader>drl", '<cmd>lua require"dap".repl.run_last()<CR>', opts)
map("n", "<leader>d?", ':lua local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes)<CR>', opts)
map("n", "<leader>dh", ':lua require"dap.ui.widgets".hover()<CR>', opts)

-- jester
map("n", "<leader>djdr", '<cmd>lua require"jester".debug({ path_to_jest = "../node_modules/.bin/jest" })<CR>', opts)
map("n", "<leader>djr", ':lua require"jester".run()<cr>', opts)
map("n", "<leader>djl", ':lua require"jester".run_last()<cr>', opts)
map("n", "<leader>djf", ':lua require"jester".run_file()<cr>', opts)
map("n", "<leader>djdl", ':lua require"jester".debug_last({ path_to_jest = "../node_modules/.bin/jest" })<cr>', opts)
map("n", "<leader>djdf", ':lua require"jester".debug_file({ path_to_jest = "../node_modules/.bin/jest" })<cr>', opts)

-- telescope-dap
map("n", "<leader>dtc", '<cmd>lua require"telescope".extensions.dap.commands{}<CR>', opts)
map("n", "<leader>dts", '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>', opts)
map("n", "<leader>dtb", '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>', opts)
map("n", "<leader>dtv", '<cmd>lua require"telescope".extensions.dap.variables{}<CR>', opts)
map("n", "<leader>dtf", '<cmd>lua require"telescope".extensions.dap.frames{}<CR>', opts)
map("n", "<leader>dui", '<cmd>lua require("dapui").toggle()<CR>', opts)

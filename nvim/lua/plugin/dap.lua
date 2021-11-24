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

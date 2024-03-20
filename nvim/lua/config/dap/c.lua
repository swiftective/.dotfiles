local dap = require "dap"

dap.adapters.cppdbg = {
  id = "cppdbg",
  type = "executable",
  command = "OpenDebugAD7",
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      local exe = vim.fn.input "Path to executable: "

      return vim.fn.getcwd() .. "/" .. exe
    end,
    args = function()
      local num = tonumber(vim.fn.input "No. of args: ")

      if not num then
        print "dap: That's not a number"
        return
      end

      local args = {}

      for i = 1, num do
        local arg = vim.fn.input("arg" .. i .. ": ")
        table.insert(args, arg)
      end

      return args
    end,
    cwd = "${workspaceFolder}",
    stopAtEntry = true,
  },
  {
    name = "Attach to gdbserver :1234",
    type = "cppdbg",
    request = "launch",
    MIMode = "gdb",
    miDebuggerServerAddress = "localhost:1234",
    miDebuggerPath = "/usr/bin/gdb",
    cwd = "${workspaceFolder}",
    program = function()
      local exe = vim.fn.input "Path to executable: "

      return vim.fn.getcwd() .. "/" .. exe
    end,
  },
}
dap.configurations.c = dap.configurations.cpp

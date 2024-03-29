local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local HOME = os.getenv "HOME"

local workspace_dir = HOME .. "/.local/state/jdtls/" .. project_name

local config = {
  cmd = {
    "java17",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-jar",
    HOME .. "/.local/share/jdtls/plugins/org.eclipse.equinox.launcher_1.6.500.v20230717-2134.jar",
    "-configuration",
    HOME .. "/.local/share/jdtls/config_linux",
    "-data",
    workspace_dir,
  },

  root_dir = require("jdtls.setup").find_root { ".git", "mvnw", "gradlew" },

  settings = {
    java = {},
  },

  init_options = {
    bundles = {},
  },
}
require("jdtls").start_or_attach(config)

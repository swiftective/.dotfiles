-- ╭━╮╱╱╭┳━┳╮╱╱╱╱╭╮╭╮
-- ┃━╋┳┳╋┫━┫╰┳━┳━┫╰╋╋━┳━┳━╮
-- ┣━┃┃┃┃┃╭┫╭┫┻┫━┫╭┫┣╮┃╭┫┻┫
-- ╰━┻━━┻┻╯╰━┻━┻━┻━┻╯╰━╯╰━╯

if require "swft.first_load"() then
  return
end

pcall(require, "swft.disable_builtins")
pcall(require, "impatient")
pcall(require, "plugin.packer")
pcall(require, "plugin.telescope")
pcall(require, "plugin.lsp-config")
pcall(require, "plugin.cmp")
pcall(require, "plugin.mason")
pcall(require, "plugin.nvimtree")
pcall(require, "plugin.eviline")
pcall(require, "swft.options")
pcall(require, "swft.keymaps")
pcall(require, "swft.colors")
pcall(require, "swft.functions")

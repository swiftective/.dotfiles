local download_packer = function()
  if vim.fn.input "Download Packer? (y for yes) " ~= "y" then
    return
  end

  local directory = string.format("%s/site/pack/packer/start/", vim.fn.stdpath "data")

  vim.fn.mkdir(directory, "p")

  vim.fn.system(
    string.format("git clone %s %s", "https://github.com/wbthomason/packer.nvim", directory .. "/packer.nvim")
  )

  vim.cmd "packadd packer.nvim"
  require "plugin.packer"
  vim.cmd "PackerSync"
end

return function()
  if not pcall(require, "packer") then
    download_packer()

    return true
  end

  return false
end

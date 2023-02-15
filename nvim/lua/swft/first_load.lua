local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

local download_lazy = function()
  if vim.fn.input "Download Lazy Plugin Manager? (y for yes) " ~= "y" then
    return
  end

  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
  vim.opt.rtp:prepend(lazypath)
end

return function()
  if not vim.loop.fs_stat(lazypath) then
    download_lazy()
    return true
  end

  vim.opt.rtp:prepend(lazypath)
  return false
end

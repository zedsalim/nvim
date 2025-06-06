-----------------------------------------------------------
-- BOOTSTRAP LAZY.NVIM PLUGIN MANAGER
-----------------------------------------------------------

-- Define the path where lazy.nvim will be installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Clone lazy.nvim if not already installed
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", -- official repo
    "--branch=stable", -- use latest stable release
    lazypath,
  })
end

-- Prepend lazy.nvim to runtime path
vim.opt.rtp:prepend(lazypath)

-----------------------------------------------------------
-- SETUP LAZY.NVIM WITH PLUGIN IMPORTS
-----------------------------------------------------------

require("lazy").setup({
  { import = "zed.plugins" }, -- core plugins
  { import = "zed.plugins.lsp" }, -- LSP-related plugins
}, {
  checker = {
    enabled = true, -- automatically check for plugin updates
    notify = false, -- disable notifications for updates
  },
  change_detection = {
    notify = false, -- disable notifications when plugin config changes
  },
})

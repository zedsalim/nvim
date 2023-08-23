require("zed.plugins-setup")
require("zed.core.options")
require("zed.core.keymaps")
require("zed.core.colorscheme")
require("zed.plugins.comment")
-- require("zed.plugins.nvim-tree")
-- require("zed.plugins.lualine")
require("zed.plugins.telescope")
require("zed.plugins.nvim-cmp")
require("zed.plugins.lsp.mason")
require("zed.plugins.lsp.lspsaga")
require("zed.plugins.lsp.lspconfig")
require("zed.plugins.lsp.null-ls")
require("zed.plugins.autopairs")
require("zed.plugins.treesitter")
require("zed.plugins.gitsigns")
require("zed.plugins.toggleterm")

vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
vim.cmd([[hi NonText guibg=NONE ctermbg=NONE]])
vim.cmd([[hi LineNr guibg=NONE ctermbg=NONE]])
vim.opt.winblend = 40
vim.opt.laststatus = 0
vim.opt.showtabline = 0

-- Automatically set formatoptions when opening files
vim.cmd([[
  augroup AutoFormatOptions
    autocmd!
    autocmd FileType * setlocal formatoptions-=cro
  augroup END
]])

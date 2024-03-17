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

-- Show all tab titles side by side with different formatting for the current tab
vim.o.showtabline = 2
vim.o.tabline = [[%!v:lua.MyTabline()]]
function MyTabline()
	local s = ""
	local current_tab = vim.fn.tabpagenr()
	for i = 1, vim.fn.tabpagenr("$") do
		local buflist = vim.fn.tabpagebuflist(i)
		local winnr = vim.fn.tabpagewinnr(i)
		local winbufnr = buflist[winnr]
		local bufname = vim.fn.bufname(winbufnr)
		local tab_title = (bufname == "" and "[No Name]" or vim.fn.fnamemodify(bufname, ":t"))

		if i == current_tab then
			s = s .. "%" .. i .. "T" .. "✅" .. tab_title .. " "
		else
			s = s .. "%" .. i .. "T" .. tab_title .. " "
		end
	end
	return s
end

-- Automatically set formatoptions when opening files
vim.cmd([[
  augroup AutoFormatOptions
    autocmd!
    autocmd FileType * setlocal formatoptions-=cro
  augroup END
]])

vim.cmd([[
  command! -nargs=0 X :! /bin/bash "/mnt/FILES/My_Stuff/TASM/script.sh" %:r
]])

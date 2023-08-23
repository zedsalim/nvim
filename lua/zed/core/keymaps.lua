vim.g.mapleader = " "

local key = vim.keymap

---------------------
-- General Keymaps
---------------------
key.set("n", "<Esc>", ":nohl<CR>") -- clear highlights
key.set("n", "<C-s>", "<cmd> w <CR>") -- save file
key.set("i", "<C-s>", "<cmd> w <CR>") -- save file
key.set("n", "<C-q>", "<cmd> q! <CR>") -- quit without saving
key.set("n", "x", '"_x') -- delete single character without copying into register
key.set("n", "<leader>v", "<C-w>v") -- split window vertically
key.set("n", "<leader>h", "<C-w>s") -- split window horizontally
key.set("n", "<leader>we", "<C-w>=") -- make split windows equal width & height
key.set("n", "<leader>q", ":close<CR>") -- close current split window
-- switch between windows
key.set("n", "<C-Left>", "<C-w>h")
key.set("n", "<C-Right>", "<C-w>h")
key.set("n", "<C-Down>", "<C-w>j")
key.set("n", "<C-Up>", "<C-w>k")
key.set("n", "<space>t", ":tabnew<CR>") -- open new tab
key.set("n", "<tab>", ":tabn<CR>") --  go to next tab
key.set("n", "<S-tab>", ":tabp<CR>") --  go to previous tab
key.set("i", "<C-a>", "<ESC>^i") -- go to beginning of line
key.set("i", "<C-e>", "<End>") -- go to end of line
key.set("n", "<Left>", "<Left>")
key.set("n", "<Right>", "<Right>")
key.set("n", "<Down>", "<Down>")
key.set("n", "<Up>", "<Up>")
----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
key.set("n", "<leader>m", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
-- key.set("n", "<leader>n", ":NvimTreeToggle<CR>") -- toggle file explorer

-- netrw
key.set("n", "<leader>n", ":let g:netrw_winsize = 20<CR>:Lex<CR>", { noremap = true, silent = true })

-- telescope
key.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>") -- find files inside current working directory
key.set("n", "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>") -- find all files inside current working directory
key.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>") -- find string in current working directory as you type
key.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>") -- find string under cursor in current working directory
key.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>") -- list open buffers in current neovim instance
key.set("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>") -- find in current buffer
key.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>") -- list available help tags

-- telescope git commands
key.set("n", "<leader>gc", "<cmd>Telescope git_commits<CR>") -- list all git commits (use <CR> to checkout) ["gc" for git commits]
key.set("n", "<leader>gs", "<cmd>Telescope git_status<CR>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server
key.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- toggleterm
-- key.set("n", "<A-return>", ":ToggleTerm direction=float size=20<CR>")
-- key.set("i", "<A-return>", ":ToggleTerm direction=float size=20<CR>")
-- key.set("n", "<A-h>", ":ToggleTerm direction=horizontal size=20<CR>")
-- key.set("n", "<A-v>", ":ToggleTerm direction=vertical size=80<CR>")
-- key.set("i", "<A-h>", ":ToggleTerm direction=horizontal size=20<CR>")
-- key.set("i", "<A-v>", ":ToggleTerm direction=vertical size=80<C>")

-- Window Navigation
key.set("n", "<C-Up>", ":TmuxNavigateUp<CR>")
key.set("n", "<C-Down>", ":TmuxNavigateDown<CR>")
key.set("n", "<C-Left>", ":TmuxNavigateLeft<CR>")
key.set("n", "<C-Right>", ":TmuxNavigateRight<CR>")

-- Terminal buffer --
vim.api.nvim_set_keymap("n", "<C-Return>", ":term<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-Return>", "<Esc>:term<CR>", { noremap = true, silent = true })
-- opens :term in insert mode directly
vim.cmd([[
  augroup TerminalAutoInsert
    autocmd!
    autocmd TermOpen * startinsert
  augroup END
]])
-- closes the terminal buffer
vim.cmd([[
  autocmd! TermOpen * tnoremap <buffer> <Esc> <C-\><C-n>:bd!<CR>
]])
-- End of Terminal buffer --

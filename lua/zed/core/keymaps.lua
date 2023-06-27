vim.g.mapleader = " "

local key = vim.keymap

---------------------
-- General Keymaps
---------------------
key.set("n", "<Esc>", ":nohl<CR>") -- clear highlights
key.set("n", "<C-s>", "<cmd> w <CR>") -- save file
key.set("i", "<C-s>", "<cmd> w <CR>") -- save file
key.set("n", "<C-sq>", "<cmd> wq <CR>") -- save file and quit
key.set("n", "<C-q>", "<cmd> q! <CR>") -- quit without saving
key.set("n", "x", '"_x') -- delete single character without copying into register
key.set("n", "<leader>wv", "<C-w>v") -- split window vertically
key.set("n", "<leader>wh", "<C-w>s") -- split window horizontally
key.set("n", "<leader>we", "<C-w>=") -- make split windows equal width & height
key.set("n", "<leader>wq", ":close<CR>") -- close current split window
-- switch between windows
key.set("n", "<C-Left>", "<C-w>h")
key.set("n", "<C-Right>", "<C-w>h")
key.set("n", "<C-Down>", "<C-w>j")
key.set("n", "<C-Up>", "<C-w>k")

key.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
key.set("n", "<leader>tq", ":tabclose<CR>") -- close current tab
key.set("n", "<tab>", ":tabn<CR>") --  go to next tab
key.set("n", "<S-tab>", ":tabp<CR>") --  go to previous tab
key.set("i", "<C-b>", "<ESC>^i") -- go to beginning of line
key.set("i", "<C-e>", "<End>") -- go to end of line
-- navigate inside insert mode
key.set("i", "<C-h>", "<Left>")
key.set("i", "<C-l>", "<Right>")
key.set("i", "<C-j>", "<Down>")
key.set("i", "<C-k>", "<Up>")
key.set("n", "<Left>", "<Left>")
key.set("n", "<Right>", "<Right>")
key.set("n", "<Down>", "<Down>")
key.set("n", "<Up>", "<Up>")
----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
key.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
key.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
key.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>") -- find files inside current working directory
key.set("n", "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>") -- find all files inside current working directory
key.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>") -- find string in current working directory as you type
key.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>") -- find string under cursor in current working directory
key.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>") -- list open buffers in current neovim instance
key.set("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>") -- find in current buffer
key.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>") -- list available help tags

-- telescope git commands (not on youtube nvim video)
key.set("n", "<leader>gc", "<cmd>Telescope git_commits<CR>") -- list all git commits (use <CR> to checkout) ["gc" for git commits]
key.set("n", "<leader>gs", "<cmd>Telescope git_status<CR>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server
key.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- key.set("n", "<leader>/", "gcc") -- comment toggle current line
-- key.set("v", "<leader>/", "gc") -- comment toggle linewise (visual)"

-- toggleterm
-- key.set("n", "<A-return>", ":ToggleTerm direction=float size=20<CR>")
-- key.set("i", "<A-return>", ":ToggleTerm direction=float size=20<CR>")
-- key.set("n", "<A-h>", ":ToggleTerm direction=horizontal size=20<CR>")
-- key.set("n", "<A-v>", ":ToggleTerm direction=vertical size=80<CR>")
-- key.set("i", "<A-h>", ":ToggleTerm direction=horizontal size=20<CR>")
-- key.set("i", "<A-v>", ":ToggleTerm direction=vertical size=80<C>")

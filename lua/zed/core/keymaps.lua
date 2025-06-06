-----------------------------------------------------------
-- KEYMAPS
-----------------------------------------------------------

-- Set <Space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-----------------------------------------------------------
-- GENERAL
-----------------------------------------------------------

-- Clear search highlight
keymap.set("n", "<Esc>", ":nohl<CR>", opts)

-- Quit/save shortcuts
keymap.set("n", "<C-s>", ":w<CR>", opts)
keymap.set("i", "<C-s>", "<Esc>:w<CR>", opts)
keymap.set("n", "<C-q>", ":q!<CR>", opts)
keymap.set("i", "<C-q>", "<Esc>:q!<CR>", opts)

-- Delete character without copying
keymap.set("n", "x", '"_x', { desc = "Delete character without copying" })

-- Increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-----------------------------------------------------------
-- WINDOW MANAGEMENT
-----------------------------------------------------------

-- Split windows
keymap.set("n", "<leader>sv", ":vsplit<CR>", opts)
keymap.set("n", "<leader>sh", ":split<CR>", opts)
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equalize split sizes" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Window navigation (with tmux integration)
keymap.set("n", "<C-Up>", ":TmuxNavigateUp<CR>", opts)
keymap.set("n", "<C-Down>", ":TmuxNavigateDown<CR>", opts)
keymap.set("n", "<C-Left>", ":TmuxNavigateLeft<CR>", opts)
keymap.set("n", "<C-Right>", ":TmuxNavigateRight<CR>", opts)

-----------------------------------------------------------
-- TAB / BUFFER MANAGEMENT
-----------------------------------------------------------

-- New/close tabs
keymap.set("n", "<C-t>", ":tabnew<CR>", opts)
-- keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open new tab" })
-- keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close current tab" })
-- keymap.set("n", "<leader>tf", ":tabnew %<CR>", { desc = "Open buffer in new tab" })

-- Buffer navigation
keymap.set("n", "<Tab>", ":bnext<CR>")
keymap.set("n", "<S-Tab>", ":bprevious<CR>")

-----------------------------------------------------------
-- FILE EXPLORER & NAVIGATION
-----------------------------------------------------------

-- Toggle NvimTree
keymap.set("n", "<C-Space>", "<cmd>NvimTreeFindFileToggle<CR>", opts) -- toggle file explorer on current file
-- keymap.set("n", "<C-Space>", "<cmd>NvimTreeToggle<CR>", opts) -- toggle file explorer

-- Quick file search (Telescope)
keymap.set("n", "<C-p>", ":Telescope find_files<CR>", opts)
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })

-----------------------------------------------------------
-- LSP / FORMATTING / DIAGNOSTICS
-----------------------------------------------------------

-- Format document
keymap.set("n", "<leader>p", ":lua vim.lsp.buf.format()<CR>", opts)

-- Code actions
keymap.set("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opts)

-- Diagnostics
keymap.set("n", "[d", ":lua vim.diagnostic.goto_prev()<CR>", opts)
keymap.set("n", "]d", ":lua vim.diagnostic.goto_next()<CR>", opts)

-- Hover info
keymap.set("n", "gh", ":lua vim.lsp.buf.hover()<CR>", opts)

-----------------------------------------------------------
-- TERMINAL MANAGEMENT (ToggleTerm + builtin :term)
-----------------------------------------------------------

-- Toggle floating terminal using ToggleTerm
keymap.set("n", "<A-CR>", ":ToggleTerm<CR>", opts)
keymap.set("t", "<A-CR>", "<C-\\><C-n>:ToggleTerm<CR>", opts)

-- Open builtin terminal
keymap.set("n", "<C-Return>", ":term<CR>", opts)
keymap.set("i", "<C-Return>", "<Esc>:term<CR>", opts)

-- Auto start insert mode in terminal
vim.cmd([[
  augroup TerminalAutoInsert
    autocmd!
    autocmd TermOpen * startinsert
  augroup END
]])

-- Close terminal buffer on <Esc>
vim.cmd([[
  autocmd! TermOpen * tnoremap <buffer> <Esc> <C-\><C-n>:bd!<CR>
]])

-----------------------------------------------------------
-- SMART SAVE / FORMATTER FOR PHP
-----------------------------------------------------------

_G.save_or_fix = function()
  local filetype = vim.bo.filetype
  if filetype == "php" then
    vim.cmd("w | silent !php-cs-fixer fix % --using-cache=no")
  else
    vim.cmd("w")
  end
end

keymap.set("n", "<C-s>", ":lua _G.save_or_fix()<CR>", { noremap = true, silent = true, desc = "Save or fix PHP" })
keymap.set("i", "<C-s>", "<Esc>:lua _G.save_or_fix()<CR>a", { noremap = true, silent = true })

-----------------------------------------------------------
-- VISUAL MODE ENHANCEMENTS
-----------------------------------------------------------

-- Persistent indentation in visual mode
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- Move lines up/down
keymap.set("v", "<C-Up>", ":m '<-2<CR>gv=gv", opts)
keymap.set("v", "<C-Down>", ":m '>+1<CR>gv=gv", opts)

-- Toggle comment (requires comment.nvim)
keymap.set("v", "<leader>c", "gc", { remap = true })
keymap.set("n", "<leader>c", "gcc", { remap = true })

-----------------------------------------------------------
-- OPTIONAL / DISABLED KEYMAPS
-----------------------------------------------------------

-- Exit insert mode with jk
-- keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- Tab navigation (leader key alternative)
-- keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Next tab" })
-- keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Previous tab" })

-- Alternative horizontal/vertical terminals
-- keymap.set("n", "<A-h>", ":ToggleTerm direction=horizontal size=20<CR>")
-- keymap.set("n", "<A-v>", ":ToggleTerm direction=vertical size=80<CR>")

-----------------------------------------------------------
-- BASIC SETTINGS
-----------------------------------------------------------

-- Use tree-style view for netrw
vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- Show absolute line number
opt.number = true

-- Show relative line numbers
opt.relativenumber = true

-- Highlight the current line
opt.cursorline = true

-- More space in the command line
opt.cmdheight = 2

-- Keep lines above and below the cursor
opt.scrolloff = 16

-- File encoding
opt.fileencoding = "utf-8"

-- Highlight all matches on search
opt.hlsearch = true

-----------------------------------------------------------
-- TABS & INDENTATION
-----------------------------------------------------------

-- Number of spaces a tab counts for
opt.tabstop = 2

-- Size of an indent
opt.shiftwidth = 2

-- Convert tabs to spaces
opt.expandtab = true

-- Copy indent from current line
opt.autoindent = true

-----------------------------------------------------------
-- TEXT DISPLAY
-----------------------------------------------------------

-- Enable line wrap
opt.wrap = true

-- Wrap lines at word boundary
opt.linebreak = true

-- Always show the sign column
opt.signcolumn = "yes"

-- Show `` in markdown files
opt.conceallevel = 0

-- Treat dash-connected words as one word
opt.iskeyword:append("-")

-----------------------------------------------------------
-- SEARCH
-----------------------------------------------------------

-- Ignore case in search patterns
opt.ignorecase = true

-- Use smart case if search includes uppercase
opt.smartcase = true

-----------------------------------------------------------
-- COLORS
-----------------------------------------------------------

-- Enable true color support
opt.termguicolors = true

-- Use dark background
opt.background = "dark"

-----------------------------------------------------------
-- BACKSPACE & CLIPBOARD
-----------------------------------------------------------

-- Allow backspace over everything in insert mode
opt.backspace = "indent,eol,start"

-- Use system clipboard
opt.clipboard:append("unnamedplus")

-----------------------------------------------------------
-- WINDOW SPLITS
-----------------------------------------------------------

-- Vertical splits open to the right
opt.splitright = true

-- Horizontal splits open below
opt.splitbelow = true

-----------------------------------------------------------
-- SWAP / UNDO
-----------------------------------------------------------

-- Enable swapfile
opt.swapfile = true

-- Set undo directory
opt.undodir = vim.fn.expand("/tmp/nvim_un")

-- Enable persistent undo
opt.undofile = true

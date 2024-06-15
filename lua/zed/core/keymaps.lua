vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<Esc>", ":nohl<CR>", { desc = "Clear search highlights" })
-- keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<C-q>", "<cmd> q! <CR>", { desc = "Quit without saving" }) -- quit without saving
keymap.set("n", "x", '"_x', { desc = "delete single character without copying into register" }) -- delete single character without copying into register

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<C-Left>", "<C-w>h")
keymap.set("n", "<C-Right>", "<C-w>h")
keymap.set("n", "<C-Down>", "<C-w>j")
keymap.set("n", "<C-Up>", "<C-w>k")

keymap.set("n", "<C-Up>", ":TmuxNavigateUp<CR>")
keymap.set("n", "<C-Down>", ":TmuxNavigateDown<CR>")
keymap.set("n", "<C-Left>", ":TmuxNavigateLeft<CR>")
keymap.set("n", "<C-Right>", ":TmuxNavigateRight<CR>")

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
-- keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
-- keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<tab>", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<S-tab>", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- toggleterm
keymap.set("n", "<A-return>", ":ToggleTerm direction=float size=20<CR>")
keymap.set("i", "<A-return>", ":ToggleTerm direction=float size=20<CR>")
-- keymap.set("n", "<A-h>", ":ToggleTerm direction=horizontal size=20<CR>")
-- keymap.set("n", "<A-v>", ":ToggleTerm direction=vertical size=80<CR>")
-- keymap.set("i", "<A-h>", ":ToggleTerm direction=horizontal size=20<CR>")
-- keymap.set("i", "<A-v>", ":ToggleTerm direction=vertical size=80<C>")

---------------------------------------------------------------------------
-- Define a function to conditionally run a command based on the file type
_G.save_or_fix = function()
  local filetype = vim.bo.filetype
  if filetype == "php" then
    -- Run php-cs-fixer and save the file
    vim.cmd("w | silent !php-cs-fixer fix % --using-cache=no")
  else
    -- Save the file for other file types
    vim.cmd("w")
  end
end

-- Set key mappings to call the function
vim.api.nvim_set_keymap(
  "n",
  "<C-s>",
  ":lua _G.save_or_fix()<CR>",
  { noremap = true, silent = true, desc = "Save or fix PHP file in normal mode" }
)
vim.api.nvim_set_keymap(
  "i",
  "<C-s>",
  "<Esc>:lua _G.save_or_fix()<CR>a",
  { noremap = true, silent = true, desc = "Save or fix PHP file in insert mode" }
)

-- keymap.set("n", "<C-s>", "<cmd> w <CR>", { desc = "Save file normal mode" }) -- save file
-- keymap.set("i", "<C-s>", "<cmd> w <CR>", { desc = "Save file insert mode" }) -- save file
--
----------------------------------------------------------------------------
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

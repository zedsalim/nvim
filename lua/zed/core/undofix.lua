-----------------------------------------------------------
-- UNDO TREE WITH CUSTOM DIRECTORY HANDLING
-----------------------------------------------------------

-- Prevent reloading the script multiple times
if vim.g.loaded_vim_undodir_tree then
  return
end
vim.g.loaded_vim_undodir_tree = 1

-- Exit early if undofile is not enabled
if not vim.opt.undofile:get() then
  return
end

-- Temporarily disable persistent undo
vim.opt.undofile = false

-- Generate undo file path by decoding escaped characters (%% -> /)
local function get_undo_file(filepath)
  local undofile = vim.fn.undofile(filepath)
  undofile = undofile:gsub("%%", "/")
  undofile = undofile:gsub("//", "/")
  return undofile
end

-- Write undo file manually to custom directory
local function write_undo_file()
  vim.opt.undofile = false
  local undofile = get_undo_file(vim.fn.expand("%:p"))
  local undodir = vim.fn.fnamemodify(undofile, ":h")

  -- Create the directory if it doesn't exist
  if vim.fn.isdirectory(undodir) == 0 then
    vim.fn.mkdir(undodir, "p")
  end

  -- Save undo history to file
  vim.cmd("wundo " .. vim.fn.fnameescape(undofile))
end

-- Read undo file when buffer is opened
local function read_undo_file()
  local undofile = get_undo_file(vim.fn.expand("%:p"))

  -- Restore undo history if undo file exists
  if vim.fn.filereadable(undofile) == 1 then
    vim.cmd("silent! rundo " .. vim.fn.fnameescape(undofile))
  end
end

-- Create a custom autocommand group for undo file actions
vim.api.nvim_create_augroup("vim_undodir_tree", { clear = true })

-- Save undo file after each buffer write
vim.api.nvim_create_autocmd("BufWritePost", {
  group = "vim_undodir_tree",
  pattern = "*",
  callback = write_undo_file,
})

-- Restore undo file after reading a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = "vim_undodir_tree",
  pattern = "*",
  callback = read_undo_file,
})

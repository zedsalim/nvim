if vim.g.loaded_vim_undodir_tree then
  return
end
vim.g.loaded_vim_undodir_tree = 1

if not vim.opt.undofile:get() then
  return
end

vim.opt.undofile = false

local function get_undo_file(filepath)
  local undofile = vim.fn.undofile(filepath)
  undofile = undofile:gsub("%%", "/")
  undofile = undofile:gsub("//", "/")
  return undofile
end

local function write_undo_file()
  vim.opt.undofile = false
  local undofile = get_undo_file(vim.fn.expand("%:p"))
  local undodir = vim.fn.fnamemodify(undofile, ":h")
  if vim.fn.isdirectory(undodir) == 0 then
    vim.fn.mkdir(undodir, "p")
  end
  vim.cmd("wundo " .. vim.fn.fnameescape(undofile))
end

local function read_undo_file()
  local undofile = get_undo_file(vim.fn.expand("%:p"))
  if vim.fn.filereadable(undofile) == 1 then
    vim.cmd("silent! rundo " .. vim.fn.fnameescape(undofile))
  end
end

vim.api.nvim_create_augroup("vim_undodir_tree", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  group = "vim_undodir_tree",
  pattern = "*",
  callback = write_undo_file,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  group = "vim_undodir_tree",
  pattern = "*",
  callback = read_undo_file,
})

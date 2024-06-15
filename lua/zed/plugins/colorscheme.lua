return {
  "Mofiqul/vscode.nvim",
  priority = 1000,
  config = function()
    local status, _ = pcall(vim.cmd, "colorscheme vscode")
    if not status then
      print("Colorscheme not found!") -- print error if colorscheme not installed
      return
    end
  end,
}

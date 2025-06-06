-----------------------------------------------------------
-- POIMANDRES: Colorscheme Setup
-----------------------------------------------------------

return {
  "olivercederborg/poimandres.nvim",
  priority = 1000, -- load early for colorscheme
  config = function()
    local status, _ = pcall(vim.cmd, "colorscheme poimandres")
    if not status then
      print("Colorscheme not found!") -- print error if colorscheme not installed
      return
    end
  end,
}

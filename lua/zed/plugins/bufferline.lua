-----------------------------------------------------------
-- BUFFERLINE: Tab Line Plugin Setup
-----------------------------------------------------------

return {
  "akinsho/bufferline.nvim",
  -- icons for bufferline
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- use latest stable version
  version = "*",
  opts = {
    options = {
      -- show tabs instead of buffers
      mode = "tabs",
    },
  },
}

-----------------------------------------------------------
-- INDENT-BLANKLINE.NVIM: Display Indentation Guides Setup
-----------------------------------------------------------
return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",

  -- Configure indent character to display as thin vertical bar
  opts = {
    indent = { char = "┊" },
  },
}

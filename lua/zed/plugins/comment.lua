-----------------------------------------------------------
-- COMMENT.NVIM: Commenting Plugin Setup
-----------------------------------------------------------

return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" }, -- load on buffer read or new file
  dependencies = {
    -- Context-aware commentstring integration for treesitter
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    -- import comment plugin safely
    local comment = require("Comment")

    -- import treesitter context commentstring integration
    local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

    -- enable comment plugin with pre_hook for context awareness
    comment.setup({
      pre_hook = ts_context_commentstring.create_pre_hook(),
    })
  end,
}

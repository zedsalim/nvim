-----------------------------------------------------------
-- TREESITTER: SYNTAX HIGHLIGHTING, INDENTATION & AUTOTAGGING
-----------------------------------------------------------

return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local ok, ts = pcall(require, "nvim-treesitter.configs")
    if not ok then
      return
    end

    ts.setup({
      highlight = { enable = true },
      indent = { enable = true },
      autotag = { enable = true },
      ensure_installed = {
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "prisma",
        "markdown",
        "markdown_inline",
        "svelte",
        "graphql",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "query",
        "vimdoc",
        "c",
        "python",
        "php",
      },
    })
  end,
}

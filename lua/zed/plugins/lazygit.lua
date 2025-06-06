-----------------------------------------------------------
-- LAZYGIT: Git integration with floating window support
-----------------------------------------------------------
return {
  "kdheepak/lazygit.nvim",

  -- commands to trigger loading the plugin
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },

  -- optional dependency for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  -- recommended keybinding to lazy-load plugin on demand
  keys = {
    { "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
  },
}

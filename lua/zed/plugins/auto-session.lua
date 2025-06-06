-----------------------------------------------------------
-- AUTO-SESSION: Session Management Plugin Configuration
-----------------------------------------------------------

return {
  "rmagatti/auto-session",
  config = function()
    local auto_session = require("auto-session")

    -----------------------------------------------------------
    -- Plugin Setup
    -----------------------------------------------------------
    auto_session.setup({
      -- Disable automatic session restore on startup
      auto_restore_enabled = false,

      -- Suppress sessions in these directories
      auto_session_suppress_dirs = {
        "~/",
        "~/Dev/",
        "~/Downloads",
        "~/Documents",
        "~/Desktop/",
      },
    })

    local keymap = vim.keymap

    -----------------------------------------------------------
    -- Keymaps for Session Management
    -----------------------------------------------------------

    -- Restore session for current working directory
    keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", {
      desc = "Restore session for cwd",
    })

    -- Save session for auto session root directory
    keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", {
      desc = "Save session for auto session root dir",
    })
  end,
}

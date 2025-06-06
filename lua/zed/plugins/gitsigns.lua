-----------------------------------------------------------
-- GITSIGNS.NVIM: Git Integration and Hunk Navigation Setup
-----------------------------------------------------------
return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      -- Navigation mappings
      -- Go to next hunk
      map("n", "]h", gs.next_hunk, "Next Hunk")
      -- Go to previous hunk
      map("n", "[h", gs.prev_hunk, "Prev Hunk")

      -- Actions mappings
      -- Stage current hunk
      map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
      -- Reset current hunk
      map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
      -- Stage hunk in visual selection
      map("v", "<leader>hs", function()
        gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Stage hunk")
      -- Reset hunk in visual selection
      map("v", "<leader>hr", function()
        gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Reset hunk")

      -- Stage entire buffer
      map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
      -- Reset entire buffer
      map("n", "<leader>hR", gs.reset_buffer, "Reset buffer")

      -- Undo last stage hunk
      map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")

      -- Preview the current hunk changes
      map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")

      -- Show full blame info for current line
      map("n", "<leader>hb", function()
        gs.blame_line({ full = true })
      end, "Blame line")
      -- Toggle inline blame annotation for current line
      map("n", "<leader>hB", gs.toggle_current_line_blame, "Toggle line blame")

      -- Show diff for current buffer against index
      map("n", "<leader>hd", gs.diffthis, "Diff this")
      -- Show diff for current buffer against previous commit
      map("n", "<leader>hD", function()
        gs.diffthis("~")
      end, "Diff this ~")

      -- Text object mapping for hunk selection in operator-pending and visual mode
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
    end,
  },
}

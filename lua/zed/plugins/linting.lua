-----------------------------------------------------------
-- NVIM-LINT: Asynchronous linting for various filetypes
-----------------------------------------------------------
return {
  "mfussenegger/nvim-lint",

  -- load plugin on buffer read or new file
  event = { "BufReadPre", "BufNewFile" },

  config = function()
    local lint = require("lint")

    -- define linters for specific filetypes
    lint.linters_by_ft = {
      js = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      svelte = { "eslint_d" },
      python = { "pylint" },
    }

    -- create autocmd group for linting
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    -- trigger linting on buffer enter, write, or insert leave
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    -- keymap to manually trigger linting for current file
    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}

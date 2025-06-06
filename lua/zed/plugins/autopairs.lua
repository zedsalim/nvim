-----------------------------------------------------------
-- NVIM-AUTOPAIRS: Automatic Pairing of Brackets and Quotes
-----------------------------------------------------------

return {
  "windwp/nvim-autopairs",
  event = { "InsertEnter" },
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  config = function()
    -----------------------------------------------------------
    -- Import nvim-autopairs and Setup Configuration
    -----------------------------------------------------------
    local autopairs = require("nvim-autopairs")

    autopairs.setup({
      -- enable treesitter integration
      check_ts = true,
      ts_config = {
        -- exclude pairs in lua string nodes
        lua = { "string" },
        -- exclude pairs in js template strings
        javascript = { "template_string" },
        -- disable treesitter check on java
        java = false,
      },
    })

    -----------------------------------------------------------
    -- Setup nvim-autopairs Completion Integration with nvim-cmp
    -----------------------------------------------------------
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")

    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}

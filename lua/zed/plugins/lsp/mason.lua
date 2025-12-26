-----------------------------------------------------------
-- MASON: LSP SERVERS, FORMATTERS, AND TOOL INSTALLATION
-----------------------------------------------------------

return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    require("mason-lspconfig").setup({
      ensure_installed = {
        "clangd",
        "bashls",
        "marksman",
        "html",
        "cssls",
        "lua_ls",
        "emmet_ls",
        "prismals",
        "pyright",
      },
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        "mdformat",
        "prettier",
        "stylua",
        "isort",
        "black",
        "pylint",
        "eslint_d",
      },
    })
  end,
}

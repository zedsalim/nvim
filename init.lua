vim.env.PATH = vim.env.PATH .. ":/home/zed/.nvm/versions/node/v22.14.0/bin"

require("zed.core")
require("zed.lazy")
require("colorizer").setup()

vim.api.nvim_create_user_command("Ara", "set termbidi", {})
vim.api.nvim_create_user_command("Nara", "set termbidi!", {})

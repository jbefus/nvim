print("init lua loaded")
require("user.mappings")
require("user.settings")
require("user.plugins")
require("user.cmp")
require("user.lsp")
require("user.telescope")
require("user.treesitter")
require("user.comment")
require("user.gitsigns")
require("user.nvimtree")

vim.cmd [[colorscheme dracula]]
vim.cmd [[:PackerCompile]]
vim.cmd [[:PackerInstall]]

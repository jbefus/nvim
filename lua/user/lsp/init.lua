
local status_ok, lsp = pcall(require, "lspconfig")
if not status_ok then
  print("couldn't setup lsp"..lsp)
  return
end

require "user.lsp.configs"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"

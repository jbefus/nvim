local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

mason.setup()
local status_ok_config, lsp_installer = pcall(require, "mason-lspconfig")
if not status_ok_config then
	return
end

local servers = {
	"dockerls",
	"omnisharp",
	"tailwindcss",
	"tsserver",
	"marksman",
	"svelte",
	"jsonls",
	"lua_ls",
	"rust_analyzer",
}

lsp_installer.setup({
	ensure_installed = servers,
})

local lspconfig = require("lspconfig")

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
	end
	lspconfig[server].setup(opts)
end

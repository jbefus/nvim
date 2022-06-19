local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	print("couldn't load null-ls" .. null_ls)
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier,
		formatting.stylua,
		diagnostics.eslint,
		null_ls.builtins.code_actions.eslint,
		-- diagnostics.flake8
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function(client)
					vim.lsp.buf.formatting_sync()
				end,
			})
		end
	end,
})

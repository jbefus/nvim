local M = {}

-- TODO: backfill this to template
M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		-- disable virtual text
		virtual_text = false,
		-- show signs
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

local function lsp_highlight_document(client)
	-- Set autocommands conditional on server_capabilities
	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		return
	end
	illuminate.on_attach(client)
	-- end
end

local function lsp_keymaps()
	vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
	vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
	vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
	vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
	vim.keymap.set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
	vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>")
	vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
	-- vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
	vim.keymap.set("n", "<leader>ca", "<cmd>CodeActionMenu<CR>")
	vim.keymap.set("n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>")
	vim.keymap.set("n", "<leader>dN", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>')
	vim.keymap.set("n", "<leader>dn", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>')
	vim.keymap.set("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>")
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()' ]])
	vim.keymap.set("n", "<M-F>", "<cmd>Format<cr>")
end

-- Utility function
function Dump(o)
	if type(o) == "table" then
		local s = "{ "
		for k, v in pairs(o) do
			if type(k) ~= "number" then
				k = '"' .. k .. '"'
			end
			s = s .. "[" .. k .. "] = " .. Dump(v) .. ","
		end
		return s .. "} "
	else
		return tostring(o)
	end
end

M.on_attach = function(client)
	-- vim.notify(client.name .. " starting...")
	-- TODO: refactor this into a method that checks if string in list
	print("client name", client.name)
	if client.name == "tsserver" or client.name == "sumneko_lua" then
		client.server_capabilities.document_formatting = false
		client.server_capabilities["document_range_formatting"] = false
	end
	lsp_keymaps()
	lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M

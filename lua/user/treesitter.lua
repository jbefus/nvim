local ok, tsc = pcall(require, "nvim-treesitter.configs")
if not ok then
	print("couldn't configure treesitter" .. tsc)
	return
end
tsc.setup({
	highlight = {
		enable = true,
		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		-- This is just a testline of commejt
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = true },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<Leader>nn",
			node_incremental = "<Leader>nn",
			scope_incremental = "<Leader>sn",
			node_decremental = "<Leader>pn",
		},
	},
})

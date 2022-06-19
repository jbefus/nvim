local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	print("couldn't load toggleterm" .. toggleterm)
	return
end

toggleterm.setup({
	size = 20,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
	},
})

function _G.set_terminal_keymaps()
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]])
	vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-W>h]])
	vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-W>j]])
	vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-W>k]])
	vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-W>l]])
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end

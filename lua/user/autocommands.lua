-- Highlight Yanked Text
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
	end,
})

-- To make auto file reload work.... this doesnt really work...
vim.api.nvim_create_autocmd({ "FocusGained" }, { command = [[:checktime]] })

-- -- Keymaps are automatically loaded on the VeryLazy event
-- -- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
local map = vim.keymap.set
-- diagnostic
local diagnostic_goto = function(next, severity)
    local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
    severity = severity and vim.diagnostic.severity[severity] or nil
    return function()
        go({ severity = severity })
    end
end
-- map("n", "<leader>h", "<C-w>h", { desc = "Go to Left Window", remap = true })
-- map("n", "<leader>j", "<C-w>j", { desc = "Go to Lower Window", remap = true })
-- map("n", "<leader>k", "<C-w>k", { desc = "Go to Upper Window", remap = true })
-- map("n", "<leader>l", "<C-w>l", { desc = "Go to Right Window", remap = true })
--
map("i", "jk", "<Esc>", { desc = "Escape" })
map("n", "<leader>dn", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "<leader>dN", diagnostic_goto(false), { desc = "Prev Diagnostic" })

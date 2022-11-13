-- userhome = "~\\AppData\\Local\\nvim\\init.lua<CR>" -- WINDOWS
-- userhome = "~/.config/nvim/init.lua<CR>" -- UNIX
vim.g.mapleader = " "
vim.keymap.set("n", "<Leader>w", ":write<CR>")
vim.keymap.set("n", "<Leader>qq", ":qa!<CR>")
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "<C-v>", '"+gP')

-- pane nav / C-w
vim.keymap.set("n", "<Leader>j", "<C-w>j")
vim.keymap.set("n", "<Leader>k", "<C-w>k")
vim.keymap.set("n", "<Leader>l", "<C-w>l")
vim.keymap.set("n", "<Leader>h", "<C-w>h")
vim.keymap.set("n", "<Leader>c", "<C-w>c")

-- indentation
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- source config file (WINDOWS)
-- vim.keymap.set('n', '<Leader>sr', ':source ' .. os.getenv("MYVIMRC"))

-- buffer navigation
vim.keymap.set("n", "<leader>bl", ":bnext<CR>")
vim.keymap.set("n", "<leader>bh", ":bprevious<CR>")

-- move line up and down
vim.keymap.set("n", "<A-j>", ":m .+1<cr>==")
vim.keymap.set("n", "<A-k>", ":m .-2<cr>==")
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv")
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv")

-- telescope
vim.keymap.set("n", "<C-p>", ":Telescope git_files<cr>")
vim.keymap.set("n", "<A-p>", ":Telescope live_grep<cr>")
-- nvim tree
vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<cr>")

-- replace paste with keep paste
vim.keymap.set("v", "p", '"_dp')

-- DAP
vim.keymap.set("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
vim.keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>")
vim.keymap.set("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>")
vim.keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>")
vim.keymap.set("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>")
vim.keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>")
vim.keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>")
vim.keymap.set("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>")
vim.keymap.set("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>")

-- nnoremap <SPACE> <Nop>
-- let mapleader = " "

-- noremap <leader>w :w<cr>
-- noremap <leader>j <C-w>j
-- noremap <leader>k <C-w>k
-- noremap <leader>l <C-w>l
-- noremap <leader>h <C-w>h

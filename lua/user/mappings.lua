print("loading mappings..")
-- userhome = "~\\AppData\\Local\\nvim\\init.lua<CR>" -- WINDOWS
-- userhome = "~/.config/nvim/init.lua<CR>" -- UNIX
vim.g.mapleader = ' '
vim.keymap.set('n', '<Leader>w', ':write<CR>')
vim.keymap.set('i', 'jk', '<ESC>')
vim.keymap.set('n', '<C-v>', '"+gP')

-- pane nav
vim.keymap.set('n', '<Leader>j', '<C-w>j')
vim.keymap.set('n', '<Leader>k', '<C-w>k')
vim.keymap.set('n', '<Leader>l', '<C-w>l')
vim.keymap.set('n', '<Leader>h', '<C-w>h')

-- indentation
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')

-- source config file (WINDOWS)
-- vim.keymap.set('n', '<Leader>sr', ':source ' .. os.getenv("MYVIMRC"))

-- buffer navigation
vim.keymap.set('n', '<S-Left>', ':bprevious<CR>')
vim.keymap.set('n', '<S-Right>', ':bnext<CR>')

-- move line up and down
vim.keymap.set('n', '<A-j>', ':m .+1<cr>==')
vim.keymap.set('n', '<A-k>', ':m .-2<cr>==')
vim.keymap.set('x', '<A-j>', ":move '>+1<CR>gv-gv")
vim.keymap.set('x', '<A-k>', ":move '<-2<CR>gv-gv")

-- telescope
vim.keymap.set('n', '<C-p>', ':Telescope git_files<cr>')
vim.keymap.set('n', '<A-p>', ':Telescope live_grep<cr>')
vim.keymap.set('n', '<C-b>', ':Telescope file_browser<cr>')

-- replace paste with keep paste
vim.keymap.set("v", "p", '"_dp')
-- nnoremap <SPACE> <Nop>
-- let mapleader = " "

-- noremap <leader>w :w<cr>
-- noremap <leader>j <C-w>j
-- noremap <leader>k <C-w>k
-- noremap <leader>l <C-w>l
-- noremap <leader>h <C-w>h

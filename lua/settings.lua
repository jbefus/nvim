print("loading settings...")
local set = vim.opt

vim.opt.autoindent = true
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true
set.relativenumber = true
set.number = true
set.fileencoding = "utf-8"
set.clipboard = "unnamedplus"
vim.cmd [[set mouse=a]]
set.cursorline = true
set.swapfile = false
set.undofile = true
set.numberwidth = 2
set.termguicolors = true
set.cmdheight = 2

-- syntax enable                           " Enables syntax highlighing
-- set encoding=utf-8                      " The encoding displayed
-- set relativenumber
-- set fileencoding=utf-8                  " The encoding written to file
-- set ruler              			            " Show the cursor position all the time
-- set mouse=a                             " Enable your mouse
-- set splitbelow                          " Horizontal splits will automatically be below
-- set splitright                          " Vertical splits will automatically be to the right
-- set conceallevel=0                      " So that I can see `` in markdown files
-- set tabstop=4                           " Insert 2 spaces for a tab
-- set shiftwidth=4                        " Change the number of space characters inserted for indentation
-- set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
-- set expandtab                           " Converts tabs to spaces
-- set smartindent                         " Makes indenting smart
-- set autoindent                          " Good auto indent
-- set laststatus=0                        " Always display the status line
-- set number                              " Line numbers
-- set cursorline                          " Enable highlighting of the current line
-- set background=dark                     " tell vim what the background color looks like
-- set showtabline=4                       " Always show tabs
-- set nobackup                            " This is recommended by coc
-- set nowritebackup                       " This is recommended by coc
-- set clipboard=unnamedplus

-- " You can't stop me

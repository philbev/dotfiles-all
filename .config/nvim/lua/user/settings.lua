--  ____       _   _   _
-- / ___|  ___| |_| |_(_)_ __   __ _ ___
-- \___ \ / _ \ __| __| | '_ \ / _` / __|
--  ___) |  __/ |_| |_| | | | | (_| \__ \
-- |____/ \___|\__|\__|_|_| |_|\__, |___/
--                             |___/

-- -- USING API FUNCTIONS
-- Neovim provides a set of API functions to either set an option or get its current value:
--
-- Global options:
-- vim.api.nvim_set_option()
-- vim.api.nvim_get_option()
-- Buffer-local options:
-- vim.api.nvim_buf_set_option()
-- vim.api.nvim_buf_get_option()
-- Window-local options:
-- vim.api.nvim_win_set_option()
-- vim.api.nvim_win_get_option()
--
-- USING META-ACCESSORS
-- A few meta-accessors are available if you want to set options in a more "idiomatic" way. They essentially wrap the above
-- API functions and allow you to manipulate options as if they were variables:
--
-- vim.o: behaves like :set
-- vim.go: behaves like :setglobal
-- vim.bo: behaves like :setlocal for buffer-local options
-- vim.wo: behaves like :setlocal for window-local options

vim.notify = require("notify")

local set = vim.o
set.smarttab = true
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
-- set.autoindent = true
set.smartindent = true
set.wrap = true
set.number = true
set.relativenumber = true
set.mouse = 'a'
set.splitbelow = true
set.splitright = true
set.termguicolors = true
set.clipboard = 'unnamedplus'
set.pastetoggle = '<F11>'
set.ignorecase = true
set.smartcase = true
set.cursorline = true
set.listchars = 'tab:🢡 ,eol:⮰,space:·,trail:+'
set.spelllang = 'en'
set.pumheight = 15
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.cpoptions:append('W')

vim.cmd('highlight CursorLine guibg=#404040')
vim.cmd(':highlight NonText guifg=yellow')
vim.cmd(':highlight Pmenu guibg=#404040')
vim.cmd('hi IndentBlanklineChar guifg=gray')
vim.cmd([[au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=1000}]])
vim.cmd('let g:nvim_tree_indent_markers = 1')

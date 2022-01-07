--[[
         (_)_ __ (_) |_  | |_   _  __ _
         | | '_ \| | __| | | | | |/ _` |
         | | | | | | |_ _| | |_| | (_| |
         |_|_| |_|_|\__(_)_|\__,_|\__,_|
]]
-- ************************************************
-- *          NEOVIM INITIALISATION FILE          *
-- ************************************************

require('settings')
require('mappings')
require('packer-conf')
require('nvim-tree-conf')
require('nvim-cmp-conf')
require('lsp-conf')
require('lsp-conf.lua-server')
require('ultisnips-conf')
require('treesitter-conf')
require('telescope-conf')
require('whichkey-conf')
require('nvim-autopairs-conf')
require('nvim-ts-rainbow-conf')
require "indent_blankline-conf"
--require('lualine-conf')
--require('tabline_nvim-conf')
--require 'barbar-conf'
require('airline-conf')
require('gitsigns-conf')
require('toggleterm-conf')

-- vim.cmd('highlight NonText guibg=yellow')
vim.cmd('highlight PMenu guibg=#404040')
vim.cmd('highlight NonText guibg=NONE guifg=yellow')
-- vim.cmd('au BufWinEnter,Bufenter,BufReadPost * source $HOME/.config/nvim/lua/tabline_nvim-conf/init.lua')
-- vim.cmd('au BufWinEnter,Bufenter,BufReadPost * source $HOME/.config/nvim/lua/barbar-conf/init.lua')

-- Uncomment the following to have Vim jump to the last position when reopening a file
vim.cmd([[au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]])

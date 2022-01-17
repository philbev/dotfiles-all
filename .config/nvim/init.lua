--[[
         (_)_ __ (_) |_  | |_   _  __ _
         | | '_ \| | __| | | | | |/ _` |
         | | | | | | |_ _| | |_| | (_| |
         |_|_| |_|_|\__(_)_|\__,_|\__,_|
]]
-- ************************************************
-- *          NEOVIM INITIALISATION FILE          *
-- ************************************************

require('user.nvim-cmp')
require('user.airline')
require 'user.barbar'
require('user.gitsigns')
require 'user.indent_blankline'
require('user.lsp')
require('user.sumneko_lua')
require('user.mappings')
require('user.nvim-autopairs')
require('user.nvim-tree')
require('user.nvim-ts-rainbow')
require('user.packer')
require('user.settings')
require('user.telescope')
require('user.toggleterm')
require('user.treesitter')
require('user.ultisnips')
require('user.whichkey')
require('user.nvim-colorizer')

-- vim.cmd('highlight NonText guibg=yellow')
vim.cmd('highlight PMenu guibg=#404040')
vim.cmd('highlight NonText guibg=NONE guifg=yellow')
-- vim.cmd('au BufWinEnter,Bufenter,BufReadPost * source $HOME/.config/nvim/lua/tabline_nvim-conf/init.lua')
-- vim.cmd('au BufWinEnter,Bufenter,BufReadPost * source $HOME/.config/nvim/lua/barbar-conf/init.lua')

-- Uncomment the following to have Vim jump to the last position when reopening a file
vim.cmd([[au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]])

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
require('lualine-conf')
require('whichkey-conf')
require('nvim-autopairs-conf')
require('nvim-ts-rainbow-conf')
require('tabline_nvim-conf')
require('indent_guides-conf')



-- vim.cmd('highlight NonText guibg=yellow')
vim.cmd('highlight PMenu guibg=#404040')
vim.cmd('au BufWinEnter,Bufenter,BufRead * source $HOME/.config/nvim/lua/tabline_nvim-conf/init.lua')

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



-- vim.cmd('highlight NonText guibg=yellow')
vim.cmd('highlight PMenu guibg=#404040')

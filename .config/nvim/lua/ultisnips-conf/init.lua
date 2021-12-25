-- **************************************************
-- *          ULTISNIPS CONFIGURATION FILE          *
-- **************************************************
-- Track the engine.
-- use 'SirVer/ultisnips'

-- Snippets are separated from the engine. Add this if you want them:
-- use 'honza/vim-snippets'

-- Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
-- - https://github.com/Valloric/YouCompleteMe
-- - https://github.com/nvim-lua/completion-nvim
vim.cmd('let g:UltiSnipsExpandTrigger="<tab>"')
vim.cmd('let g:UltiSnipsJumpForwardTrigger="<tab>"')
vim.cmd('let g:UltiSnipsJumpBackwardTrigger="<S-tab>"')

-- If you want :UltiSnipsEdit to split your window.
-- let g:UltiSnipsEditSplit="vertical"

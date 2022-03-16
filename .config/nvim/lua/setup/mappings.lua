--  __  __                   _                       _
-- |  \/  | __ _ _ __  _ __ (_)_ __   __ _ ___      | |_   _  __ _
-- | |\/| |/ _` | '_ \| '_ \| | '_ \ / _` / __|     | | | | |/ _` |
-- | |  | | (_| | |_) | |_) | | | | | (_| \__ \  _  | | |_| | (_| |
-- |_|  |_|\__,_| .__/| .__/|_|_| |_|\__, |___/ (_) |_|\__,_|\__,_|
--              |_|   |_|            |___/

-- Neovim provides a list of API functions to set, get and delete mappings:
-- 
-- Global mappings:
-- vim.api.nvim_set_keymap()
-- vim.api.nvim_get_keymap()
-- vim.api.nvim_del_keymap()
-- Buffer-local mappings:
-- vim.api.nvim_buf_set_keymap()
-- vim.api.nvim_buf_get_keymap()
-- vim.api.nvim_buf_del_keymap()


local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- NORMAL MODE MAPPINGS
map('n', '<leader>x', ':xa<cr>', opts)
map('n', '<leader>s', ':w | so %<cr>', opts)
map('n', '<leader>q', ':qa<cr>', opts)
map('n', '<leader>w', ':wa<cr>', opts)
map('n', '<F2>', ':nohl<cr>', opts)
map('n', '<F3>', ':set spell! spell?<cr>', opts)
map('n', '<F4>', ':set relativenumber! relativenumber?<cr>', opts)
map('n', '<F12>', ':edit $MYVIMRC<cr>', opts)
map('n', '<F24>', ':source $MYVIMRC<cr>', opts)		-- <F24> = <S-F12>
map('n', '<M-Del>', ':bdelete<cr>', opts)
map('n', '<M-Down>', ':m +1<cr>', opts)
map('n', '<M-Up>', ':m -2<cr>', opts)
map('n', '<M-/>', ':bnext<cr>', opts)
map('n', '<M-\\>', ':bprevious<cr>', opts)
map('n', '<M-n>', '<C-w>w', opts)
map('n', '<M-c>', '<C-w>c', opts)
map('n', '<M-l>', ':set list! list?<cr>', opts)
map('n', '<M-o>', ':only<cr>', opts)
map('n', '<leader>gs', ':Git<cr>', opts)
vim.keymap.set({'n'}, "<A-w>", '<cmd>set wrap! wrap?<cr>', opts)

-- VISUAL MODE MAPPINGS
map('v', '<M-Down>', ":m '>+1<cr>gv", opts)
map('v', '<M-Up>', ':m -2<cr>gv', opts)

--  __  __                   _                       _
-- |  \/  | __ _ _ __  _ __ (_)_ __   __ _ ___      | |_   _  __ _
-- | |\/| |/ _` | '_ \| '_ \| | '_ \ / _` / __|     | | | | |/ _` |
-- | |  | | (_| | |_) | |_) | | | | | (_| \__ \  _  | | |_| | (_| |
-- |_|  |_|\__,_| .__/| .__/|_|_| |_|\__, |___/ (_) |_|\__,_|\__,_|
--              |_|   |_|            |___/

-- ~/.config/nvim/lua/setup/mappings.lua

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


-- local map = vim.api.nvim_set_keymap
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- NORMAL MODE MAPPINGS
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)
map('n', '<F12>', ':edit $MYVIMRC<cr>', opts)
map('n', '<F24>', ':source $MYVIMRC<cr>', opts)		-- <F24> => <S-F12>
map('n', '<F2>', ':nohl<cr>', opts)
map('n', '<F3>', ':set spell! spell?<cr>', opts)
map('n', '<F4>', ':set relativenumber! relativenumber?<cr>', opts)
map('n', '<M-,>', ':bprevious<cr>', opts)
map('n', '<M-.>', ':bnext<cr>', opts)
map('n', '<M-Del>', ':bdelete<cr>', opts)
map('n', '<M-Down>', ':m +1<cr>', opts)
map('n', '<M-Up>', ':m -2<cr>', opts)
map('n', '<M-c>', '<C-w>c', opts)
map('n', '<M-l>', ':set list! list?<cr>', opts)
map('n', '<M-n>', '<C-w>w', opts)
map('n', '<M-o>', ':only<cr>', opts)
map('n', '<leader>gs', ':Git<cr>', opts)
map('n', '<leader>q', ':qa<cr>', opts)
map('n', '<leader>s', ':w | so %<cr>', opts)
map('n', '<leader>w', ':wa<cr>', opts)
map('n', '<leader>x', ':xa<cr>', opts)
map({'n'}, "<M-w>", '<cmd>set wrap! wrap?<cr>', opts)
map({'n'}, '<M-/>', '<cmd>Neotree toggle<cr>')
map({'n'}, '<M-d>', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>')
map({'n'}, '<M-u>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>')

-- VISUAL MODE MAPPINGS
map('v', '<M-Down>', ":m '>+1<cr>gv", opts)
map('v', '<M-Up>', ':m -2<cr>gv', opts)

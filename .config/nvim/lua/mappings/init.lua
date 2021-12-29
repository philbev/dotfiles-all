-- **********************************
-- *          KEY MAPPINGS          *
-- **********************************

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
vim.g.mapleader = '\\'

-- Nvim-tree
map('n', '<leader>n', ':NvimTreeToggle<cr>', opts)

map('n', '<M-Del>', ':bdelete<cr>', opts)
map('n', '<M-Down>', ':m+1<cr>==', opts)
map('n', '<M-Up>', ':m-2<cr>==', opts)
map('n', '<M-.>', ':bnext<cr>', opts)
map('n', '<M-,>', ':bprevious<cr>', opts)
map('n', '<M-/>', ':bnext<cr>', opts)
map('n', '<M-\\>', ':bprevious<cr>', opts)
map('n', '<M-c>', ':close<cr>', opts)
map('n', '<M-n>', '<C-w>w', opts)
map('n', '<F2>', ':nohlsearch<cr>', opts)
map('n', '<F3>', ':set spell! spell?<cr>', opts)
map('n', '<F4>', ':set relativenumber! relativenumber?<cr>', opts)
map('n', '<F24>', ':source $MYVIMRC<cr>', { noremap = true })
map('n', '<F12>', ':edit $MYVIMRC<cr>', opts)

-- VISUAL MODE MAPPINGS
map('v', '<M-Down>', ":m '> +1<cr>gv=gv", opts )
map('v', '<M-Up>', ":m'< -2<cr>gv=gv", opts )





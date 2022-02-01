--   ____ _ _                                _ _     _
--  / ___(_) |_ ___ ___  _ __ ___  _ __ ___ (_) |_  | |_   _  __ _
-- | |  _| | __/ __/ _ \| '_ ` _ \| '_ ` _ \| | __| | | | | |/ _` |
-- | |_| | | || (_| (_) | | | | | | | | | | | | |_ _| | |_| | (_| |
--  \____|_|\__\___\___/|_| |_| |_|_| |_| |_|_|\__(_)_|\__,_|\__,_|
--

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<F10>', ':edit ~/.config/nvim/after/ftplugin/gitcommit.lua<cr>', opts)
map('n', '<F22>', ':source ~/.config/nvim/after/ftplugin/gitcommit.lua<cr>', opts)

-- vim.api.nvim_win_set_option(0, 'spell', true)

vim.wo.spell = true

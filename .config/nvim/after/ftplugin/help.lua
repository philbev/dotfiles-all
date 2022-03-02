--  _          _        _
-- | |__   ___| |_ __  | |_   _  __ _
-- | '_ \ / _ \ | '_ \ | | | | |/ _` |
-- | | | |  __/ | |_) || | |_| | (_| |
-- |_| |_|\___|_| .__(_)_|\__,_|\__,_|
--              |_|


local map = vim.api.nvim_buf_set_keymap
local opts = { noremap = true, silent = true }

map(0, 'n', '<F10>', ':edit ~/.config/nvim/after/ftplugin/help.lua<cr>', opts)
map(0, 'n', '<F22>', ':source ~/.config/nvim/after/ftplugin/help.lua<cr>', opts)
map(0, 'n', '<space>', '', opts)
map(0, 'n', 'x', '', opts)
map(0, 'n', 'b', '', opts)
map(0, 'n', '<CR>', '', opts)
map(0, 'n', '<Del>', '/|[a-zA-Z:]<cr>', opts) -- <Del> key searches for next hyperlink.

-- vim.api.nvim_win_set_option(0, 'spell', true)

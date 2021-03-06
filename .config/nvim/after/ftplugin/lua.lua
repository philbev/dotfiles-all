 -- _                  _
-- | |   _   _  __ _  | |_   _  __ _
-- | |  | | | |/ _` | | | | | |/ _` |
-- | |__| |_| | (_| |_| | |_| | (_| |
-- |_____\__,_|\__,_(_)_|\__,_|\__,_|
                                  --


local map = vim.api.nvim_buf_set_keymap
local opts = { noremap = true, silent = true }

map(0, 'n', '<F10>', ':edit ~/.config/nvim/after/ftplugin/lua.lua<cr>', opts)
map(0, 'n', '<F22>', ':source ~/.config/nvim/after/ftplugin/lua.lua<cr>', opts)
map(0, 'n', '<F5>', ':w | !lua %<cr>', opts)

-- vim.api.nvim_win_set_option(0, 'spell', true)


local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<F5>', ':w | terminal lua %<cr>a', opts)
map('n', '<F22>', ':source ~/.config/nvim/ftplugin/lua.lua<cr>', opts)  -- <F22> = Shift + <F10>
map('n', '<F10>', ':edit ~/.config/nvim/ftplugin/lua.lua<cr>', opts)

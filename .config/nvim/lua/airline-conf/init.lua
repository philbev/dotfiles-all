--     _    ___ ____  _     ___ _   _ _____        ____ ___  _   _ _____
--    / \  |_ _|  _ \| |   |_ _| \ | | ____|      / ___/ _ \| \ | |  ___|
--   / _ \  | || |_) | |    | ||  \| |  _|       | |  | | | |  \| | |_
--  / ___ \ | ||  _ <| |___ | || |\  | |___   _  | |__| |_| | |\  |  _|
-- /_/   \_\___|_| \_\_____|___|_| \_|_____| (_)  \____\___/|_| \_|_|

vim.cmd([[au VimEnter * AirlineTheme cobalt2]])

vim.cmd([[let g:airline_left_sep = ''
let g:airline_right_sep = '']])

vim.cmd([[let g:airline#extensions#tabline#enabled = 1]])


vim.cmd(([[
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
]]))


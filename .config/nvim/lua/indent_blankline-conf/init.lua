-- ****************************************************
-- *          INDENT BLANKLINE CONFIGURATION          *
-- ****************************************************

vim.opt.list = false
vim.opt.listchars:append("eol:⮰")
vim.cmd([[highlight IndentBlanklineChar guifg=#606060]])

local indent = require('indent_blankline')

indent.setup{
    -- show_current_context = true,
    -- show_current_context_start = true,
    show_end_of_line = false
}


-- See https://github.com/nanotee/nvim-lua-guide for explanation.

local keymap = vim.api.nvim_set_keymap

-- NORMAL MODE MAPPINGS
-- ====================

keymap('n', '<c-s>', ':w<CR>', {})
keymap('n', '<M-/>', ':bn<cr>', {}) -- <Alt>+/ = next buffer
keymap('n', '<M-\\>', ':bp<cr>', {}) -- <Alt>+\ = Previous buffer.
keymap('n', '<M-.>', ':bp<cr>', {}) -- <Alt>+. = Previous buffer.
keymap('n', '<M-Del>', ':bd<cr>', {})   -- <Alt>+<Del> = Delete buffer.
keymap('n', '<M-N>', 'n', {}) -- <Alt>+N = New window.
keymap('n', '<M-n>', '', {})    -- <Alt>+n = Next window.
keymap('n', '<M-c>', 'c', {}) -- <Alt>+c = Close window.
keymap('n', '<M-o>', 'o', {}) -- <Alt>+o = Only window (Close all others).
keymap('n', '<M-s>', 's', {}) -- <Alt>+s = Split window.
keymap('n', '<M-v>', 'v', {}) -- <Alt>+v = Split window vertically.
keymap('n', '<M-w>', 'w', {}) -- <Alt>+w = Next window.
keymap('n', '<M-z>', '1GO#!/usr/bin/zsh<ESC>:set ft=zsh<CR>', {})   -- <Alt+z> = Insert #! and set filetype.
keymap('n', '<M-#>', '', {})  -- <Alt>+# = Edit alternate buffer.
keymap('n', '<C-Down>', '', {})   -- <Ctrl>+<DOWN> = Scroll up one line.
keymap('n', '<M-Down>', 'ddp', {})  -- <Alt>+<DOWN> = Move text on current line down one line.
keymap('n', '<C-Up>', '', {}) -- <Ctrl>+<UP> = Scroll up one line.
keymap('n', '<M-Up>', 'ddkP', {})   -- <Alt>+<DOWN> = Move text on current line up one line.
keymap('n', '<Leader>b', '1GO#!/usr/bin/bash<ESC>:set ft=sh<CR>', {})   -- \b = Insert #! and set filetype.
keymap('n', '<M-l>', ':set list! list?<CR>', {})    -- <Alt>+l = Display whitespace characters.
keymap('n', '<M-e>', ':set expandtab! expandtab?<CR>', {})  -- <Alt>+e = Toggle 'Expandtab' and display.
keymap('n', '<M-T>', '^gU$yypv$r=', {}) -- <Alt>+T = Uppercase whole line and underline.
--keymap('n', '<Up>', 'gk', {})   -- <Up> = Cursor up one virtual line.
--keymap('n', '<Down>', 'gj', {}) -- <Down> = Cursor down one virtual line.
keymap('n', '<Up>', '<Nop>', {})
keymap('n', '<Down>', '<Nop>', {})
keymap('n', '<Left>', '<Nop>', {})
keymap('n', '<Right>', '<Nop>', {})
keymap('n', '<M-i>', ':set ic! ic?<CR>', {})    -- <Alt>+i = Toggle 'Ignorecase' option.
keymap('n', 'n', 'nzzzv', {})    -- Forward to next search, centre the cursorline and open any fold.
keymap('n', 'N',  'Nzzzv', {})   -- Backward to next search, centre the cursorline and open any fold.

-- INSERT MODE MAPPINGS
-- ====================

keymap('i', '<M-z>', '1G#!/usr/bin/zsh<CR><Esc>:set ft=zsh<CR>', {})    -- <Alt+z> = zsh shebang
keymap('i', '<C-f>', '<C-x><C-f>', {})  -- <Ctrl>+f = Filename completion.
keymap('i', '<C-d>', '<C-x><C-d>', {})  -- <Ctrl>+d = Macro + definition completion.
keymap('i', '<C-l>', '<C-x><C-l>', {})  -- <Ctrl>+l = Whole line completion.

-- Line below commented out as it seems to slow things down. Very noticeable
-- when leaving 'insert' mode with escape key.
-- inoremap u <Esc>gUiw`]a|""  <Alt>+u = Make word upper case.

-- VISUAL MODE MAPPINGS
-- ====================

keymap('v', '>', '>gv', {}) -- Shift right then reselect
keymap('v', '<', '<gv', {}) -- Shift left then reselect
keymap('v', '<M-Down>', 'dp`[V`]', {}) -- <Alt>+<DOWN> = Move selected lines down one line.
keymap('v', '<M-Up>', 'dkkp`[V`]', {}) -- <Alt>+<UP> = Move selected lines up one line.

-- OPERATOR PENDING MODE
-- =====================

keymap('o', '(', ':execute "normal! 0f(vi("<CR>', {silent, noremap})
keymap('o', '{', ':execute "normal! 0f{vi{"<CR>', {silent, noremap})
keymap('o', '[', ':execute "normal! 0f[vi["<CR>', {silent, noremap})
keymap('o', '<', ':execute "normal! 0f<vi<"<CR>', {silent, noremap})
keymap('o', '"', ':execute "normal! 0f\"vi\""<CR>', {silent, noremap})
keymap('o', "'", ':execute "normal! 0f\'vi\'"<CR>', {silent, noremap})

-- TERMINAL MODE MAPPINGS
-- ######################

keymap('t', '<M-/>', ':bn<cr>', {noremap})  --        <Alt>+/ = Next buffer.
keymap('t', '<M-\\>', ':bp<cr>', {noremap}) -- <Alt>+\ = Previous buffer.
keymap('t', '<M-.>', ':bp<cr>', {noremap})  -- <Alt>+. = Previous buffer.
keymap('t', '<M-Del>', ':bd<cr>', {noremap}) -- <Alt>+<Del> = Delete buffer.
keymap('t', '<M-N>', 'n', {noremap}) -- <Alt>+N = New window.
keymap('t', '<M-n>', '', {noremap}) -- <Alt>+n = Next window.
keymap('t', '<M-c>', 'c', {noremap}) -- <Alt>+c = Close window.
keymap('t', '<M-o>', 'o', {noremap}) -- <Alt>+o = Only window (Close all others).
keymap('t', '<M-s>', 's', {noremap}) -- <Alt>+s = Split window.
keymap('t', '<M-v>', 'v', {noremap}) -- <Alt>+v = Split window vertically.
keymap('t', '<M-w>', 'w', {noremap}) -- <Alt>+w = Next window.
keymap('t', '<M-#>', '', {noremap}) -- <Alt>+# = Edit alternate buffer.
--    --"In terminal mode use <A-r> to paste from registers while in 'insert' mode.
--keymap(<expr> <A-r> '<C-\><C-N>"'.nr2char(getchar()).'pi'|" -- <a-r> paste from registers in insert mode
keymap('t', '<esc>', '<c-\\><c-n>', {noremap}) --    Allows escape key to be used in terminal mode.
--
-- WINDOWS KEYS FOR GERMAN CHARACTERS
-- ==================================

keymap('i', '@sa', 'ä', {noremap}) --  <Window>+a
keymap('i', '@sA', 'Ä', {noremap}) -- <Window>+<Shift>+A
keymap('i', '@so', 'ö', {noremap}) -- <Window>+o
keymap('i', '@sO', 'Ö', {noremap}) -- <Window>+<Shift>+O
keymap('i', '@su', 'ü', {noremap}) -- <Window>+u
keymap('i', '@sU', 'Ü', {noremap}) -- <Window>+<Shift>+U
keymap('i', '@sb', 'ß', {noremap}) -- <Window>+b
keymap('i', '@sB', 'ß', {noremap}) -- <Window>+<Shift>+B
keymap('i', '@ss', 'ß', {noremap}) -- <Window>+s
keymap('i', '@sS', 'ß', {noremap}) -- <Window>+<Shift>+S


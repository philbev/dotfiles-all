set guifont=DejaVu\ Sans\ Mono\ 11
set background=dark
set lines=40
highlight Normal guibg=#404040 guifg=White

nnoremap <M-l> :set list! list?<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	    KEY MAPPINGS GO HERE"			"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <M-/> :bn<cr>|"					<ALT>+/ = Next buffer.
nnoremap <M-\> :bp<cr>|"					<ALT>+\ = Previous buffer.
nnoremap <M-.> :bp<cr>|"					<ALT>+. = Previous buffer.
nnoremap <M-Del> :bd<cr>|"					<Alt>+<Del> = Delete buffer.
nnoremap <M-N> n|"						<ALT>+N = New window.
nnoremap <M-n> |"						<ALT>+n = Next window.
nnoremap <M-c> c|"						<ALT>+c = Close window.
nnoremap <M-o> o|"						<ALT>+o = Only window (Close all others).
nnoremap <M-s> s|"						<ALT>+s = Split window.
nnoremap <M-v> v|"						<ALT>+v = Split window vertically.
noremap <M-w> w|"						<ALT>+w = Next window.
nnoremap <M-#> |"						<ALT>+# = Edit alternate buffer.
nnoremap <C-Down> |"						<CTRL>+<DOWN> = Scroll up one line.
nnoremap <M-Down> ddp|"						<ALT>+<DOWN> = Move text on current line down one line.
vnoremap <M-Down> dp`[V`]|"					<ALT>+<DOWN> = Move selected lines down one line.
nnoremap <C-Up> |"						<CTRL>+<UP> = Scroll up one line.
nnoremap <M-Up> ddkP|"						<ALT>+<DOWN> = Move text on current line up one line.
vnoremap <M-Up> dkkp`[V`]|"					<ALT>+<UP> = Move selected lines up one line.
nnoremap <Leader>b 1GO#!/usr/bin/bash<ESC>:set ft=sh<CR>|"	\b = Insert #! and set filetype.
nnoremap <M-l> :set list! list?<CR>|"				<Alt>+l = Display whitespace characters.
nnoremap <M-e> :set expandtab! expandtab?<CR>|"			<Alt>+e = Toggle 'Expandtab' and display.
nnoremap <M-T> ^gU$yypv$r=|"					<Alt>+T = Uppercase whole line and underline.
nnoremap OA gk|"						<Up> = Cursor up one virtual line.
nnoremap OB gj|"						<Down> = Cursor down one virtual line.
nnoremap <M-i> :set ic! ic?<CR>|"				<Alt>+i = Toggle 'Ignorecase' option.


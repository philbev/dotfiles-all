" MY /HOME/.NVIMRC INITIALISATION FILE

set nocompatible
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"		VUNDLE CONFIGURATION				"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.

" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Rip-Rip/clang_complete'
Plugin 'scrooloose/nerdtree'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'ratazzi/blackboard.vim'
Plugin 'shawncplus/Vim-tocterm'
Plugin 'joelfrederico/vim-HiLinkTrace'
Plugin 'ron89/thesaurus_query.vim'
Plugin 'morhetz/gruvbox'


" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()	     " required

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

au VimEnter * let g:airline_left_sep = '▶'
au VimEnter * let g:airline_right_sep = '◀'

let g:airline#extensions#whitespace#enabled = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"		CONFIGURATION OPTIONS GO HERE		"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
syntax on
"setlocal noshowmode
set spelllang=en
set nospell
set complete+=d,kspell
set cpo+=$
set dictionary=/usr/dict/words
set thesaurus=/usr/local/docs/mthesaur.txt
let g:python_host_prog = '/usr/bin'
set listchars=tab:➤\ ,eol:⤦,space:·
set noexpandtab shiftwidth=4 tabstop=8 softtabstop=4
set ignorecase smartcase
set wildmode=full wildmenu
set laststatus=2
set hidden
set nobackup
set hlsearch
set number relativenumber
set pastetoggle=<F11>
"set statusline=%<%t\ %y%m%r[%{\&ff}]\ \ \ \ [Buffer:\ %n]\ \ \ ASCII:\ %b:0x%B%=%-14.(%l,%c%V%)\ %P
set statusline=%t\ %y%m%r[%{\&ff}]\ [Buffer:\ %n][ASCII:\ %b\ (Dec)\ :\ 0x%B\ (Hex)]%=%([Line:%l\ of\ %L,Column:%c%V][%p%%]%)
set runtimepath+=~/.vim/ftplugin
set noundofile
let g:clang_close_preview = 1

set omnifunc=syntaxcomplete#Complete
set cursorline

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set bg=dark
set history&


"AUTOCOMMANDS GO HERE
augroup vimrcEx
    au!
    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
		\ if line("'\"") >= 1 && line("'\"") <= line("$") |
		\   exe "normal! g`\"" |
		\ endif
augroup END

augroup group2
    autocmd!
    au VimEnter * NoMatchParen
    au VimEnter * AirlineTheme xtermlight
    au BufWritePost .nvimrc source ~/.nvimrc
    "au BufWritePost *.vim source ~/.vim/ftplugin/%:e.vim
    "au FileType text,cpp nnoremap <buffer> <F10> :edit ~/.vim/ftplugin/%:e.vim<CR>
    "au BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp
    au BufNewFile *.html 0r ~/.vim/templates/skeleton.html
    au BufNewFile *.h source ~/.vim/cpp_header.vim
augroup END

""""""""""""""""""""""
"KEY MAPPINGS GO HERE"
""""""""""""""""""""""
if has('nvim')
    nnoremap <M-/> :bn<cr>|"						<ALT>+/ = Next buffer.
    nnoremap <M-\> :bp<cr>|"						<ALT>+\ = Previous buffer.
    nnoremap <M-.> :bp<cr>|"						<ALT>+. = Previous buffer.
    nnoremap <M-Del> :bd<cr>|"						<Alt>+<Del> = Delete buffer.
    nnoremap <M-N> n|"						<ALT>+N = New window.
    nnoremap <M-n> |"						<ALT>+n = Next window.
    nnoremap <M-c> c|"						<ALT>+c = Close window.
    nnoremap <M-o> o|"						<ALT>+o = Only window (Close all others).
    nnoremap <M-s> s|"						<ALT>+s = Split window.
    nnoremap <M-v> v|"						<ALT>+v = Split window vertically.
    noremap <M-w> w|"							<ALT>+w = Next window.
    nnoremap <M-#> |"							<ALT>+# = Edit alternate buffer.
    nnoremap <C-Down> |"						<CTRL>+<DOWN> = Scroll up one line.
    nnoremap <M-Down> ddp|"						<ALT>+<DOWN> = Move current line down one line.
    vnoremap <M-Down> dp`[V`]|"						<ALT>+<DOWN> = Move selected lines down one line.
    nnoremap <C-Up> |"						<CTRL>+<UP> = Scroll up one line.
    nnoremap <M-Up> ddkP|"						<ALT>+<UP> = Move current line up one line.
    vnoremap <M-Up> dkkp`[V`]|"						<ALT>+<UP> = Move selected lines up one line.
    nnoremap <Leader>b 1GO#!/usr/bin/bash<ESC>:set ft=sh<CR>|"		\b = Insert #! and set filetype.
    nnoremap <M-l> :set list! list?<CR>|"				<Alt>+l = Display whitespace characters.
    nnoremap <M-e> :set expandtab! expandtab?<CR>|"			<Alt>+e = Toggle 'Expandtab' and display.
    nnoremap <M-t> ^gU$yypv$r=|"					<Alt>+t = Uppercase whole line and underline.
    nnoremap <Up> gk|"							<Up> = Cursor up one virtual line.
    nnoremap <Down> gj|"						<Down> = Cursor down one virtual line.
    nnoremap <M-i> :set ic! ic?<CR>|"					<Alt>+i = Toggle 'Ignorecase' option.
else
    nnoremap / :bn<cr>|"						<ALT>+/ = Next buffer.
    nnoremap \ :bp<cr>|"						<ALT>+\ = Previous buffer.
    nnoremap . :bp<cr>|"						<ALT>+. = Previous buffer.
    nnoremap [3;3~ :bd<cr>|"						<Alt>+<Del> = Delete buffer.
    nnoremap N n|"							<ALT>+N = New window.
    nnoremap n |"							<ALT>+n = Next window.
    nnoremap c c|"							<ALT>+c = Close window.
    nnoremap o o|"							<ALT>+o = Only window (Close all others).
    nnoremap s s|"							<ALT>+s = Split window.
    nnoremap v v|"							<ALT>+v = Split window vertically.
    noremap w w|"							<ALT>+w = Next window.
    nnoremap # |"							<ALT>+# = Edit alternate buffer.
    nnoremap [1;5B |"						<CTRL>+<DOWN> = Scroll up one line.
    nnoremap [1;5A |"						<CTRL>+<UP> = Scroll up one line.
    nnoremap <Leader>b 1GO#!/usr/bin/bash<ESC>:set ft=sh<CR>|"		\b = Insert #! and set filetype.
    nnoremap l :set list! list?<CR>|"					<Alt>+l = Display whitespace characters.
    nnoremap e :set expandtab! expandtab?<CR>|"			<Alt>+e = Toggle 'Expandtab' and display.
    nnoremap t ^gU$yypv$r=|"						<Alt>+t = Uppercase whole line and underline.
    nnoremap OA gk|"							<Up> = Cursor up one virtual line.
    nnoremap OB gj|"							<Down> = Cursor down one virtual line.
    nnoremap i :set ic! ic?<CR>|"					<Alt>+i = Toggle 'Ignorecase' option.
endif

" Some insert completions
inoremap  |"		<Ctrl>+f = Filename completion.
inoremap  |"		<Ctrl>+d = Macro completion.
inoremap  |"		<Ctrl>+l = Whole line completion.
inoremap u <Esc>gUiw`]a|"	<Alt>+u = Make word upper case.

" Some Visual mode mappings
vnoremap > >gv
vnoremap < <gv

"WINDOWS KEYS FOR GERMAN CHARACTERS
inoremap @sa ä|"	<Window>+a
inoremap @sA Ä|"	<Window>+<Shift>+A
inoremap @so ö|"	<Window>+o
inoremap @sO Ö|"	<Window>+<Shift>+O
inoremap @su ü|"	<Window>+u
inoremap @sU Ü|"	<Window>+<Shift>+U
inoremap @sb ß|"	<Window>+b
inoremap @sB ß|"	<Window>+<Shift>+B
inoremap @ss ß|"	<Window>+s
inoremap @sS ß|"	<Window>+<Shift>+S

"FUNCTION KEYS <F1> TO <F12>
nnoremap <F2> :set hlsearch! hlsearch?|"		<F2> - Toggle option 'hlsearch'
nnoremap <F3> :set spell! spell?|"			<F3> - Toggle option 'spell'
nnoremap <F4> :set relativenumber! relativenumber?|"	<F4> - Toggle option 'number'
nnoremap <F9> :NERDTreeToggle|"			<F9> - Toggle NERDTree
nnoremap <F12> :e ~/.nvimrc<CR>|"			<S-F12> - Edit ~/.nvimrc
if has('nvim')
    nnoremap <F24> :so ~/.nvimrc<CR>|"			<S-F12> - Edit ~/.nvimrc
else
    nnoremap <S-F12> :so ~/.nvimrc<CR>|"		<S-F12> - Edit ~/.nvimrc
endif

"DISABLE ARROW KEYS
" Disabling the arrow keys forces me to use Vim properly.
" According to most advanced users they should not be used
" and using the Vim operators should speed things up :^)

"nnoremap <Up> <Nop>
"nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

"""""""""""""""""""""""""""""""""""""""""""""
"		ABBREVIATIONS GO HERE	    "
"""""""""""""""""""""""""""""""""""""""""""""

"inoreab #! #!/bin/bash<ESC>:set ft=sh<CR>o
inoreab @g phil@philbevan40@gmail.com
inoreab @p phil@philbev.co.uk
inoreab pbm phil@philbev.co.uk
inoreab gm philbevan40@gmail.com
inoreab pb Phil Bevan
inoreab pba Phil Bevan<cr>Flat 3<cr>90 Loughborough Road<cr>West Bridgford<cr>Nottingham<cr>NG2 7JH

"""""""""""""""""""""""""""""""""""""""""""""
"		NERDTree Options Here	    "
"""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeShowBookmarks=1

nnoremap <M-F1> :echo "		VIM FUNCTION KEYS\n
	\		⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺\n\n
		\<ALT>+<F1>	- Display Function Keys.\n
		\<F1>		- Vim help.\n
		\<F2>		- Toggle highlight search.\n
		\<F3>		- Toggle spell checking.\n
		\<F4>		- Toggle relative/absolute number.\n
		\<F9>		- Toggle NERDTree.\n
		\<F12>		- Source ~/.nvimrc.\n"<CR>


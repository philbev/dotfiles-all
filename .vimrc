" MY /HOME/.VIMRC INITIALISATION FILE

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
Plugin 'joequery/Stupid-EasyMotion'
Plugin 'easymotion/vim-easymotion'
Plugin 'chazy/cscope_maps'
Plugin 'jceb/vim-orgmode'
Plugin 'tpope/vim-speeddating'
Plugin 'luochen1990/rainbow'

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
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

let g:rainbow_active = 1
let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"		CONFIGURATION OPTIONS GO HERE		"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
syntax on
set spelllang=en
set nospell
set complete+=d,kspell
set cpo+=$
set dictionary=/usr/dict/words
set thesaurus=/usr/local/docs/mthesaur.txt
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
"set statusline=%t\ %y%m%r[%{\&ff}]\ [Buffer:\ %n][ASCII:\ %b\ (Dec)\ :\ 0x%B\ (Hex)]%=%([Line:%l\ of\ %L,Column:%c%V][%p%%]%)
set runtimepath+=~/.vim/ftplugin
set noundofile
set history=1000
let g:clang_close_preview = 1
set omnifunc=syntaxcomplete#Complete
set cursorline
if &background == "light"
    set background=dark
endif
" The two lines below are not needed if TERM is set to xterm-256color.
" Thus in this case they are no longer needed and will be commented out before
" eventually they will be deleted.
"set t_8f=[38;2;%lu;%lu;%lum
"set t_8b=[48;2;%lu;%lu;%lum

if !has("gui-running")
    set termguicolors
    highlight SpellBad ctermbg=NONE guibg=Red guifg=White
    highlight CursorLine cterm=NONE guibg=Grey40
    highlight MatchParen guibg=red
endif
" Change the color scheme here.

" Makes the background for all konsole backgrounds, no matter what the colour.
highlight Normal ctermbg=NONE guibg=#404040 guifg=White
highlight NonText ctermbg=NONE guibg=#404040 guifg=White

" This is what sets vim to use 24-bit colors. It will also work for any version of neovim
" newer than 0.1.4.
"colorscheme gruvbox

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	    AUTOCOMMANDS GO HERE			"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup group1
    autocmd!
    "au VimEnter,BufRead,BufEnter,ColorScheme * colorscheme darkbg
    au VimEnter * AirlineTheme xtermlight
    "au VimEnter * AirlineTheme base16-default
    au BufWritePost .vimrc source $MYVIMRC
    "au VimEnter  * AirlineTheme base16-harmonic16
    "au BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp
    au BufNewFile *.html 0r ~/.vim/templates/skeleton.html
    au BufNewFile *.h source ~/.vim/cpp_header.vim
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	    KEY MAPPINGS GO HERE"			"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap / :bn<cr>|"						<ALT>+/ = Next buffer.
nnoremap \ :bp<cr>|"						<ALT>+\ = Previous buffer.
nnoremap . :bp<cr>|"						<ALT>+. = Previous buffer.
nnoremap [3;3~ :bd<cr>|"					<Alt>+<Del> = Delete buffer.
nnoremap N n|"						<ALT>+N = New window.
nnoremap n |"						<ALT>+n = Next window.
nnoremap c c|"						<ALT>+c = Close window.
nnoremap o o|"						<ALT>+o = Only window (Close all others).
nnoremap s s|"						<ALT>+s = Split window.
nnoremap v v|"						<ALT>+v = Split window vertically.
nnoremap w w|"						<ALT>+w = Next window.
nnoremap # |"						<ALT>+# = Edit alternate buffer.
nnoremap [1;5B |"						<CTRL>+<DOWN> = Scroll up one line.
nnoremap [1;3B ddp|"						<ALT>+<DOWN> = Move text on current line down one line.
vnoremap [1;3B dp`[V`]|"					<ALT>+<DOWN> = Move selected lines down one line.
nnoremap [1;5A |"						<CTRL>+<UP> = Scroll up one line.
nnoremap [1;3A ddkP|"						<ALT>+<DOWN> = Move text on current line up one line.
vnoremap [1;3A dkkp`[V`]|"					<ALT>+<UP> = Move selected lines up one line.
nnoremap <Leader>b 1GO#!/usr/bin/bash<ESC>:set ft=sh<CR>|"	\b = Insert #! and set filetype.
nnoremap l :set list! list?<CR>|"				<Alt>+l = Display whitespace characters.
nnoremap e :set expandtab! expandtab?<CR>|"			<Alt>+e = Toggle 'Expandtab' and display.
nnoremap T ^gU$yypv$r=|"					<Alt>+T = Uppercase whole line and underline.
nnoremap OA gk|"						<Up> = Cursor up one virtual line.
nnoremap OB gj|"						<Down> = Cursor down one virtual line.
nnoremap i :set ic! ic?<CR>|"					<Alt>+i = Toggle 'Ignorecase' option.
"nnoremap zz :nnoremap j jzz<CR><Bar>:nnoremap k kzz<CR>
"nnoremap zb :nnoremap j jzb<CR><Bar>:nnoremap k kzb<CR>
"nnoremap zt :nnoremap j jzt<CR><Bar>:nnoremap k kzt<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	     SOME INSERT COMPLETIONS			"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

inoremap  |"		<Ctrl>+f = Filename completion.
inoremap  |"		<Ctrl>+d = Macro completion.
inoremap  |"		<Ctrl>+l = Whole line completion.
inoremap u <Esc>gUiw`]a|"	<Alt>+u = Make word upper case.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	     SOME VISUAL MODE MAPPINGS			"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

vnoremap > >gv
vnoremap < <gv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	    WINDOWS KEYS FOR GERMAN CHARACTERS		"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	    FUNCTION KEYS <F1> TO <F12>			"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F2> :set hlsearch! hlsearch?|"		<F2> - Toggle option 'hlsearch'
nnoremap <F3> :set spell! spell?|"			<F3> - Toggle option 'spell'
nnoremap <F4> :set relativenumber! relativenumber?|"	<F4> - Toggle option 'number'
nnoremap <F9> :NERDTreeToggle|"			<F9> - Toggle NERDTree
nnoremap <F12> :e ~/.vimrc<CR>|"			<S-F12> - Edit ~/.vimrc
nnoremap <S-F12> :so ~/.vimrc<CR>|"			<S-F12> - Edit ~/.vimrc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"		ABBREVIATIONS GO HERE			"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"inoreab #! #!/bin/bash<ESC>:set ft=sh<CR>o
inoreab @g phil@philbevan40@gmail.com
inoreab @p phil@philbev.co.uk
inoreab pbm phil@philbev.co.uk
inoreab gm philbevan40@gmail.com
inoreab pb Phil Bevan
inoreab pba Phil Bevan<cr>Flat 3<cr>90 Loughborough Road<cr>West Bridgford<cr>Nottingham<cr>NG2 7JH

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"		NERDTREE OPTIONS HERE			"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeShowBookmarks=1

nnoremap <M-F1> :echo "		VIM FUNCTION KEYS\n
	\		⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺\n\n
		\<ALT>+<F1>	- Display Function Keys.\n
		\<F1>		- Vim help.\n
		\<F2>		- Toggle highlight search.\n
		\<F3>		- Toggle spell checking.\n
		\<F4>		- Toggle relative/absolute number.\n
		\<F9>		- Toggle NERDTree.\n
		\<F12>		- Source ~/.vimrc.\n"<CR>


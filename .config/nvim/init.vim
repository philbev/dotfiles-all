"" MY /HOME/.CONFIG/NVIM/INIT.VIM INITIALISATION FILE
set encoding=utf-8
scriptencoding utf-8

"" VIM-PLUG CONFIGURATION

" The following lines automatically installs vim-plug if not already installed.
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    augroup vplug
        autocmd!
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    augroup END
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
"call plug#begin('~/.vim/plugged')
call plug#begin('~/.local/share/nvim/site/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'w0rp/ale'
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'dhruvasagar/vim-table-mode'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'Rip-Rip/clang_complete'
Plug 'scrooloose/nerdtree'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
"Plug 'garbas/vim-snipmate'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ratazzi/blackboard.vim'
Plug 'shawncplus/Vim-tocterm'
Plug 'joelfrederico/vim-HiLinkTrace'
Plug 'ron89/thesaurus_query.vim'
Plug 'morhetz/gruvbox'
Plug 'joequery/Stupid-EasyMotion'
Plug 'easymotion/vim-easymotion'
Plug 'chazy/cscope_maps'
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'machakann/vim-highlightedyank'
Plug 'dracula/vim', { 'as': 'dracula' }
"Plug 'vim-latex/vim-latex'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'edkolev/promptline.vim'
" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" The plugins below are for vimOrganizer
Plug 'hsitz/VimOrganizer'
Plug 'ryanoasis/vim-devicons'
Plug 'vim/killersheep'
" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run the install script
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Both options are optional. You don't have to install fzf in ~/.fzf
" and you don't have to run the install script if you use fzf only in Vim.

" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()

filetype plugin indent on


"" PLUGIN CONFIGURATIONS
"
""" AIRLINE CONFIGURATION
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
augroup airgroup
    autocmd!
    au VimEnter * let g:airline_left_sep = ''
    au VimEnter * let g:airline_right_sep = ''
augroup END
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#left_sep = ''

""" VIM-MARKDOWN CONFIGURATION
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

""" ULTISNIPS CONFIGURATION


let g:UltiSnipsEditSplit = 'horizontal'
let g:UltiSnipsExpandTrigger = '<tab>'
"let g:UltiSnipsListSnippets = '<tab>'
let g:UltiSnipsListSnippets = '<c-s>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
let g:UltiSnipsSnippetsDir = '~/.local/share/nvim/site/UltiSnips'
"let g:UltiSnipsSnippetDirectories=['vim-snippets', 'UltiSnips']
let g:UltiSnipsSnippetDirectories=['~/.local/share/nvim/site/UltiSnips']


""" DEOPLETE CONFIGURATION


let g:deoplete#enable_at_startup = 1
inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"

""" ALE CONFIGURATION


let g:ale_linters = {'python': ['flake8'], 'vim': ['vint']}
let g:ale_fixers = {'python': ['autopep8']}
"flake8 errors and warnings can be ignored. A comma separated list.
let g:ale_python_flake8_options = '--ignore=E266'
" With neovim plug-in 'deoplete' completion  doesn't play well with ALE linter
" (get far too many error messages) when in insert mode. So configured to lint
" only in normal mode.
let g:ale_lint_on_text_changed='normal'
let g:ale_fix_on_save = 1



""" THESAURUS CONFIGURATION


"let g:tq_enabled_backends=["datamuse_com","thesaurus_com","openoffice_en","mthesaur_txt"]
let g:tq_enabled_backends=['openoffice_en','datamuse_com','mthesaur_txt']
let g:tq_openoffice_en_file='/usr/local/downloads/MyThes-1.0/th_en_US_new'



""" NERDTREE OPTIONS HERE

let NERDTreeShowBookmarks=1

"" CONFIGURATION OPTIONS GO HERE

filetype plugin indent on
syntax on
set undofile
set spelllang=en
set nospell
set dictionary=/usr/share/dict/words
set complete+=d,k=/usr/share/dict/british-english
set thesaurus=/usr/local/docs/mthesaur.txt
set listchars=tab:➤\ ,eol:↲,space:·
set expandtab shiftwidth=4 tabstop=8 softtabstop=4
set ignorecase smartcase
set wildmode=full wildmenu
set laststatus=2
set hidden
set nobackup
set hlsearch
set number relativenumber
set pastetoggle=<F11>
"set statusline=%<%t\ %y%m%r[%{\&ff}]\ \ \ \ [Buffer:\ %n]\ \ \ ASCII:\ %b:0x%B%=%-14.(%l,%c%V%)\ %
"set statusline=%t\ %y%m%r[%{\&ff}]\ [Buffer:\ %n][ASCII:\ %b\ (Dec)\ :\ 0x%B\ (Hex)]%=%([Line:%l\ of\ %L,Column:%c%V][%p%%]%)
"set runtimepath+=~/.vim/ftplugin
let g:clang_close_preview = 1
let g:tex_flavor='latex'
set omnifunc=syntaxcomplete#Complete
set cursorline
if &background ==# 'light'
    set background=dark
endif
set inccommand=nosplit
if has('nvim')
    "This prevents random characters on Command-line.
    "set guicursor=
    set guicursor=n-v-c:block
    "Displays cursor in terminal mode. Useful when pasting.
    :hi! TermCursorNC ctermfg=15 guifg=#fdf6e3 ctermbg=14 guibg=#93a1a1 cterm=NONE gui=NONE
endif

if !has('gui-running')
    set termguicolors
    highlight SpellBad ctermbg=NONE guibg=Red guifg=White
    highlight CursorLine cterm=NONE guibg=Grey40
    highlight MatchParen guibg=red
endif
" Change the color scheme here.
colorscheme default

" Makes the background for all konsole backgrounds, no matter what the colour.
highlight Normal ctermbg=NONE guibg=NONE guifg=White
highlight NonText ctermbg=NONE guibg=NONE guifg=White
"highlight Normal ctermbg=NONE guibg=#404040 guifg=White
"highlight NonText ctermbg=NONE guibg=#404040 guifg=White
"highlight Search term=reverse ctermbg=11 ctermfg=0 guibg=DarkGray guifg=Black
highlight WarningMsg term=standout ctermfg=224 guifg=White guibg=Red
"au InsertEnter * highlight StatusLine term=NONE gui=bold guibg=green
"au InsertLeave * highlight StatusLine term=NONE gui=bold guibg=blue


"" KEY MAPPING
""" NORMAL MODE

nmap <silent> <C-j> <Plug>(ale_next)
nmap <silent> <C-k> <Plug>(ale_previous)
nnoremap <M-/> :bn<cr>|"                                        <ALT>+/ = Next buffer.
nnoremap <M-\> :bp<cr>|"                                        <ALT>+\ = Previous buffer.
nnoremap <M-.> :bp<cr>|"                                        <ALT>+. = Previous buffer.
nnoremap <M-Del> :bd<cr>|"                                      <Alt>+<Del> = Delete buffer.
nnoremap <M-N> n|"                                            <ALT>+N = New window.
nnoremap <M-n> |"                                           <ALT>+n = Next window.
nnoremap <M-c> c|"                                            <ALT>+c = Close window.
nnoremap <M-o> o|"                                            <ALT>+o = Only window (Close all others).
nnoremap <M-s> s|"                                            <ALT>+s = Split window.
nnoremap <M-v> v|"                                            <ALT>+v = Split window vertically.
nnoremap <M-w> w|"                                            <ALT>+w = Next window.
nnoremap <M-z> 1GO#!/usr/bin/zsh<ESC>:set ft=zsh<CR>|"          <Alt+z> = Insert #! and set filetype.
nnoremap <M-#> |"                                             <ALT>+# = Edit alternate buffer.
nnoremap <C-Down> |"                                          <CTRL>+<DOWN> = Scroll up one line.
nnoremap <M-Down> ddp|"                                         <ALT>+<DOWN> = Move text on current line down one line.
nnoremap <C-Up> |"                                            <CTRL>+<UP> = Scroll up one line.
nnoremap <M-Up> ddkP|"                                          <ALT>+<DOWN> = Move text on current line up one line.
nnoremap <Leader>b 1GO#!/usr/bin/bash<ESC>:set ft=sh<CR>|"      \b = Insert #! and set filetype.
nnoremap <M-l> :set list! list?<CR>|"                           <Alt>+l = Display whitespace characters.
nnoremap <M-e> :set expandtab! expandtab?<CR>|"                 <Alt>+e = Toggle 'Expandtab' and display.
nnoremap <M-T> ^gU$yypv$r=|"                                    <Alt>+T = Uppercase whole line and underline.
nnoremap <Up> gk|"                                              <Up> = Cursor up one virtual line.
nnoremap <Down> gj|"                                            <Down> = Cursor down one virtual line.
nnoremap <M-i> :set ic! ic?<CR>|"                               <Alt>+i = Toggle 'Ignorecase' option.

""" INSERT MODE


inoremap <M-z> 1G#!/usr/bin/zsh<Esc>:set ft=zsh<CR>
inoremap  |""             <Ctrl>+f = Filename completion.
inoremap  |""             <Ctrl>+d = Macro completion.
inoremap  |""             <Ctrl>+l = Whole line completion.
""Line below commented out as it seems to slow things down. Very noticeable
""when leaving 'insert' mode with escape key.
""inoremap u <Esc>gUiw`]a|""  <Alt>+u = Make word upper case.


""" VISUAL MODE


vnoremap > >gv
vnoremap < <gv
vnoremap <M-Down> dp`[V`]|""                                    <ALT>+<DOWN> = Move selected lines down one line.
vnoremap <M-Up> dkkp`[V`]|""                                    <ALT>+<UP> = Move selected lines up one line.


""" OPERATOR PENDING MODE


onoremap <silent> ( :execute "normal! 0f(vi("<CR>
onoremap <silent> { :execute "normal! 0f{vi{"<CR>
onoremap <silent> [ :execute "normal! 0f[vi["<CR>
onoremap <silent> < :execute "normal! 0f<vi<"<CR>
onoremap <silent> " :execute "normal! f\"vi\""<CR>
onoremap <silent> ' :execute "normal! f'vi'"<CR>


""" WINDOWS KEYS FOR GERMAN CHARACTERS

inoremap @sa ä|"        <Window>+a
inoremap @sA Ä|"        <Window>+<Shift>+A
inoremap @so ö|"        <Window>+o
inoremap @sO Ö|"        <Window>+<Shift>+O
inoremap @su ü|"        <Window>+u
inoremap @sU Ü|"        <Window>+<Shift>+U
inoremap @sb ß|"        <Window>+b
inoremap @sB ß|"        <Window>+<Shift>+B
inoremap @ss ß|"        <Window>+s
inoremap @sS ß|"        <Window>+<Shift>+S


""" TERMINAL MODE

if has('nvim')
    tnoremap <M-/> :bn<cr>|"            <ALT>+/ = Next buffer.
    tnoremap <M-\> :bp<cr>|"            <ALT>+\ = Previous buffer.
    tnoremap <M-.> :bp<cr>|"            <ALT>+. = Previous buffer.
    tnoremap <M-Del> :bd<cr>|"          <Alt>+<Del> = Delete buffer.
    tnoremap <M-N> n|"                <ALT>+N = New window.
    tnoremap <M-n> |"               <ALT>+n = Next window.
    tnoremap <M-c> c|"                <ALT>+c = Close window.
    tnoremap <M-o> o|"                <ALT>+o = Only window (Close all others).
    tnoremap <M-s> s|"                <ALT>+s = Split window.
    tnoremap <M-v> v|"                <ALT>+v = Split window vertically.
    tnoremap <M-w> w|"                <ALT>+w = Next window.
    tnoremap <M-#> |"                 <ALT>+# = Edit alternate buffer.
    "In terminal mode use <A-r> to paste from registers while in 'insert' mode.
    tnoremap <expr> <A-r> '<C-\><C-N>"'.nr2char(getchar()).'pi'
    "Allows escape key to be used in terminal mode.
    tnoremap <esc> <c-\><c-n>
endif


""" FUNCTION KEYS <F1> TO <F12>

nnoremap <F2> :set hlsearch! hlsearch?|"              <F2> - Toggle option 'hlsearch'
nnoremap <F3> :set spell! spell?|"                    <F3> - Toggle option 'spell'
nnoremap <F4> :set relativenumber! relativenumber?|"  <F4> - Toggle option 'relativenumber'
nnoremap <F9> :NERDTreeToggle|"                       <F9> - Toggle NERDTree
nnoremap <F12> :e $MYVIMRC<CR>|"                        <S-F12> - Edit $MYVIMRC
nnoremap <S-F12> :so $MYVIMRC<CR>|"                     <S-F12> - Source $MYVIMRC
nnoremap <F24> :so $MYVIMRC<CR>|"                       <S-F12> - Source $MYVIMRC



"" ABBREVIATIONS

"inoreab #! #!/bin/bash<ESC>:set ft=sh<CR>o
inoreab @g phil@philbevan40@gmail.com
inoreab @p phil@philbev.co.uk
inoreab pbm phil@philbev.co.uk
inoreab gm philbevan40@gmail.com
inoreab pb Phil Bevan
inoreab pba Phil Bevan<cr>172 Boxley Drive<cr>West Bridgford<cr>Nottingham<cr>NG2 7HB


"" AUTOCOMMANDS

augroup group1
    autocmd!
    au VimEnter * AirlineTheme xtermlight
    au BufWritePost ~/.config/nvim/init.vim source $MYVIMRC
    au BufNewFile *.h source ~/.vim/cpp_header.vim
    au BufReadPost *
                \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
                \ |   exe "normal! g`\""
                \ | endif
augroup END

let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_folding_style_pythonic = 0
let g:livepreview_previewer = 'okular'


"" VIM FUNCTION KEYS


nnoremap <M-O>3P :echo "                VIM FUNCTION KEYS\n
        \               ⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺\n\n
                \<A-F1>         - Display Function Keys.\n
                \<F1>           - Vim help.\n
                \<F2>           - Toggle highlight search.\n
                \<F3>           - Toggle spell checking.\n
                \<F4>           - Toggle relative/absolute number.\n
                \<F9>           - Toggle NERDTree.\n
                \<S-F12>        - Source ~/.vimrc.\n"<CR>


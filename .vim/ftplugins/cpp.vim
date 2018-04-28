setlocal spelllang=en
if has('nvim')
	nnoremap <buffer> <F10> :edit ~/.local/share/nvim/site/ftplugin/cpp.vim<CR>
	nnoremap <buffer> <F22> :source ~/.local/share/nvim/site/ftplugin/cpp.vim<CR>
setlocal spellfile=~/.local/share/nvim/site/spell/en.utf-8.add,~/.local/share/nvim/site/spell/cpp.utf-8.add
else
	nnoremap <buffer> <F10> :edit ~/.vim/ftplugin/cpp.vim<CR>
	nnoremap <buffer> <S-F10> :source ~/.vim/ftplugin/cpp.vim<CR>
setlocal spellfile=~/.vim/spell/en.utf-8.add,~/.vim/spell/cpp.utf-8.add
endif

augroup cpp_1
	autocmd!
	if has('nvim')
	autocmd BufEnter,BufWritePost <buffer> source ~/.local/share/nvim/site/ftplugin/cpp.vim
    else
	autocmd BufEnter,BufWritePost <buffer> source ~/.vim/ftplugin/cpp.vim
    endif
augroup END

setlocal number relativenumber
setlocal tabstop=8
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal noexpandtab


"if filereadable(expand("%:t:s/cpp/vim/"))
	"source %:t:s/cpp/vim/
"endif

" Compile and build current cpp file. See ":h filename-modifiers" for more
" details of manipulating file names and their extensions.
nnoremap <buffer> <F7> :!clear; g++ -std=c++14 -g -o %< %<cr>

"Run the compiled programme. See ":h filename-modifiers" for more
" details of manipulating file names and their extensions.
nnoremap <buffer> <F5> :!clear; %:p:r<cr>

" Debug current programme with gdb
nnoremap <buffer> <C-F5> :!gdb %<<CR>

"Generate a Makefile with /usr/local/bin/genmake.sh
nnoremap <buffer> <S-F6> :!genmake.sh %<<CR>

"Run make
nnoremap <buffer> <F6> :make<CR>
"inoremap <buffer> ' ''<Esc>i

" The following 2 lines used with tags.
inoremap <buffer> <ESC>[1;3D <C-t>
inoremap <buffer> [1;3C <C-]>

nnoremap <buffer> <Leader>c 1GO#include<iostream><cr><cr>int main(int argc, char* argv[])<cr>{<cr><cr><cr>return 0;<cr>}kkk
"nnoremap <buffer> <M-F1> :echo "\t\tFUNCTION KEYS\n
nnoremap <buffer> <M-O>3P :echo "\t\tFUNCTION KEYS\n
		\\t\t=============\n\n
		\<ALT>-<F1>\t- Help on Function Keys.\n
		\<F1>\t\t- Vim help.\n
		\<F2>\t\t- Toggle highlight search.\n
		\<F3>\t\t- Toggle spell checking.\n
		\<F4>\t\t- Toggle relative and absolute line numbers.\n
		\<F5>\t\t- Run executable compile from current source.\n
		\<CTRL>-<F5>\t- Run gdb on compiled executable.\n
		\<SHIFT>-<F6>\t- Generate Makefile with genmake.sh script.\n
		\<F6>\t\t- Run make on current .cpp buffer.\n
		\<F7>\t\t- Compile current .cpp buffer.\n
		\<F8>\t\t- Unused.\n
		\<F9>\t\t- Toggle NERDTree file manager.\n
		\<SHIFT>-<F10>\t- Source ~/.vim/ftplugin/cpp.vim.\n
		\<F10>\t\t- Edit ~/.vim/ftplugin/cpp.vim.\n
		\SHIFT>-<F11>\t- Toggle fullscreen.\n
		\<F11>\t\t- Paste toggle.\n
		\<F12>\t\t- Edit ~/.vimrc.\n
		\<SHIFT>-<F12>\t- Source ~/.vimrc.\n
		\"<CR>

" Abbreviations are added here at the end
" iab pi constants::pi
"inoreab <buffer> cout std::cout <<
"inoreab <buffer> cin std::cin >>
"inoreab <buffer> endl std::endl;
"inoreab <buffer> bitset std::bitset<>
"inoreab <buffer> hex std::hex


" Noticed in other editors when typing a "{, (, [, ", '" character the
" closing character would be filled in and the cursor placed in the correct
" position to carry on typing. The next 5 lines will simulate this :-)
"inoremap <buffer> { {}<Esc>i
"inoremap <buffer> ( ()<Esc>i
"inoremap <buffer> [ []<Esc>i
""inoremap <buffer> < <><Esc>i
"inoremap <buffer> " ""<Esc>i


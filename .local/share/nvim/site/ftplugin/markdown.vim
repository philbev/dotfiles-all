set spelllang=en
if has('nvim')
    nnoremap <buffer> <F10> :e ~/.local/share/nvim/site/ftplugin/markdown.vim<CR>|"             - <F10> Edit markdown .vim
    nnoremap <buffer> <S-F10> :so ~/.local/share/nvim/site/ftplugin/markdown.vim<CR>            - <F10> Source markdown .vim
    setlocal spellfile=~/.local/share/nvim/site/spell/en.utf-8.add,~/.local/share/nvim/site/spell/markdown.utf-8.add
else
    nnoremap <buffer> <F10> :e ~/.vim/ftplugin/markdown.vim<CR>|"             - <F10> Edit markdown .vim
    nnoremap <buffer> <S-F10> :so ~/.vim/ftplugin/markdown.vim<CR>            - <F10> Source markdown .vim
    setlocal spellfile=~/.vim/spell/en.utf-8.add,~/.local/share/nvim/site/spell/markdown.utf-8.add
endif

augroup markdown_1
    autocmd!
    if has('nvim')
	autocmd BufEnter,BufWritePost <buffer> source ~/.local/share/nvim/site/ftplugin/apache.vim
    else
	autocmd BufEnter,BufWritePost <buffer> source ~/.vim/ftplugin/apache.vim
    endif
augroup END

nnoremap <buffer> <M-1> :s/^ *//<CR>yyp:s/./=/g<CR>:nohlsearch<CR>|"        - <M-1> Header 1
inoremap <buffer> <M-1> <ESC>:s/^ *//<CR>yyp:s/./=/g<CR>:nohlsearch<CR>a|"  - <M-1> Header 1

nnoremap <buffer> <M-2> :s/^ *//<CR>yyp:s/./-/g<CR>:nohlsearch<CR>|"        - <M-2> Header 2
inoremap <buffer> <M-2> <ESC>:s/^ *//<CR>yyp:s/./-/g<CR>:nohlsearch<CR>a|"  - <M-2> Header 2



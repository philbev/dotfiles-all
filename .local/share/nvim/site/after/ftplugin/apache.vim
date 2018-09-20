setlocal spelllang=en
setlocal nospell
if has('nvim')
    nnoremap <buffer> <F10> :edit ~/.local/share/nvim/site/after/ftplugin/apache.vim<cr>
    nnoremap <buffer> <F22> :source ~/.local/share/nvim/site/after/ftplugin/apache.vim<cr>
    setlocal spellfile=~/.local/share/nvim/site/spell/en.utf-8.add,~/.local/share/nvim/site/spell/apache.utf-8.add
else
    nnoremap <buffer> <F10> :edit ~/.vim/after/ftplugin/apache.vim<cr>
    nnoremap <buffer> <S-F10> :source ~/.vim/after/ftplugin/apache.vim<cr>
    setlocal spellfile=~/.vim/spell/en.utf-8.add,~/.vim/spell/apache.utf-8.add
endif

augroup apache_1
    autocmd!
    if has('nvim')
	autocmd BufWritePost <buffer> source ~/.local/share/nvim/site/after/ftplugin/apache.vim
    else
	autocmd BufWritePost <buffer> source ~/.vim/after/ftplugin/apache.vim
    endif
augroup END


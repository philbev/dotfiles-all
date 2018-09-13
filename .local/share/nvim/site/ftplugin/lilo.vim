setlocal spelllang=en
if has('nvim')
    nnoremap <buffer> <F10> :edit ~/.local/share/nvim/site/ftplugin/lilo.vim<CR>
    nnoremap <buffer> <F22> :source ~/.local/share/nvim/site/ftplugin/lilo.vim<CR>
    setlocal spellfile=~/.local/share/nvim/site/spell/en.utf-8.add,~/.local/share/nvim/site/spell/lilo.utf-8.add
else
    nnoremap <buffer> <F10> :edit ~/.vim/ftplugin/lilo.vim<CR>
    nnoremap <buffer> <S-F10> :source ~/.vim/ftplugin/lilo.vim<CR>
    setlocal spellfile=~/.vim/spell/en.utf-8.add,~/.vim/spell/lilo.utf-8.add
endif

augroup lilo_1
    autocmd!
    if has('nvim')
	autocmd BufWritePost <buffer> source ~/.local/share/nvim/site/ftplugin/lilo.vim
    else
	autocmd BufWritePost <buffer> source ~/.vim/ftplugin/lilo.vim
    endif
augroup END


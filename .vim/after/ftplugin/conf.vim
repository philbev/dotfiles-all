setlocal spelllang=en
if has('nvim')
    nnoremap <buffer> <F10> :edit ~/.local/share/nvim/site/after/ftplugin/conf.vim<cr>
    nnoremap <buffer> <F22> :source ~/.local/share/nvim/site/after/ftplugin/conf.vim<cr>
    setlocal spellfile=~/.local/share/nvim/site/spell/en.utf-8.add,~/.local/share/nvim/site/spell/conf.utf-8.add
else
    nnoremap <buffer> <F10> :edit ~/.vim/after/ftplugin/conf.vim<cr>
    nnoremap <buffer> <S-F10> :source ~/.vim/after/ftplugin/conf.vim<cr>
    setlocal spellfile=~/.vim/spell/en.utf-8.add,~/.vim/spell/conf.utf-8.add
endif

augroup conf_1
    autocmd!
    if has('nvim')
	autocmd BufWritePost <buffer> source ~/.local/share/nvim/site/after/ftplugin/conf.vim
    else
	autocmd BufWritePost <buffer> source ~/.vim/after/ftplugin/conf.vim
    endif
augroup END


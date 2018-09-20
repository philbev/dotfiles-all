setlocal spelllang=en
if has('nvim')
    nnoremap <buffer> <F10> :edit ~/.local/share/nvim/site/after/ftplugin/samba.vim<CR>
    nnoremap <buffer> <F22> :source ~/.local/share/nvim/site/after/ftplugin/samba.vim<CR>
    setlocal spellfile=~/.local/share/nvim/site/spell/en.utf-8.add,~/.local/share/nvim/site/spell/samba.utf-8.add
else
    nnoremap <buffer> <F10> :edit ~/.vim/after/ftplugin/samba.vim<CR>
    nnoremap <buffer> <S-F10> :source ~/.vim/after/ftplugin/samba.vim<CR>
    setlocal spellfile=~/.vim/spell/en.utf-8.add,~/.vim/spell/samba.utf-8.add
endif

augroup samba_1
    autocmd!
    if has('nvim')
	autocmd BufWritePost <buffer> source ~/.local/share/nvim/site/after/ftplugin/samba.vim
    else
	autocmd BufWritePost <buffer> source ~/.vim/after/ftplugin/samba.vim
    endif
augroup END


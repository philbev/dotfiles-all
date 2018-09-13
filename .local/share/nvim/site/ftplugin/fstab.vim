setlocal spelllang=en
if has('nvim')
    nnoremap <buffer> <F10> :edit ~/.local/share/nvim/site/ftplugin/fstab.vim<CR>
    nnoremap <buffer> <F22> :source ~/.local/share/nvim/site/ftplugin/fstab.vim<CR>
setlocal spellfile=~/.local/share/nvim/site/spell/en.utf-8.add,~/.local/share/nvim/site/spell/fstab.utf-8.add
else
    nnoremap <buffer> <F10> :edit ~/.vim/ftplugin/fstab.vim<CR>
    nnoremap <buffer> <S-F10> :source ~/.vim/ftplugin/fstab.vim<CR>
setlocal spellfile=~/.vim/spell/en.utf-8.add,~/.vim/spell/fstab.utf-8.add
endif

augroup fstab_1
    autocmd!
    if has ('nvim')
    autocmd BufWritePost <buffer> source ~/.local/share/nvim/site/ftplugin/fstab.vim
else
    autocmd BufWritePost <buffer> source ~/.vim/ftplugin/fstab.vim
endif
augroup END


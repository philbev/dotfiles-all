setlocal spelllang=en
if has('nvim')
    nnoremap <buffer> <F10> :edit ~/.local/share/nvim/site/ftplugin/resolv.vim<CR>
    nnoremap <buffer> <F22> :source ~/.local/share/nvim/site/ftplugin/resolv.vim<CR>
    setlocal spellfile=~/.local/share/nvim/site/spell/en.utf-8.add,~/.local/share/nvim/site/spellresolv.utf-8.add
else
    nnoremap <buffer> <F10> :edit ~/.vim/ftplugin/resolv.vim<CR>
    nnoremap <buffer> <S-F10> :source ~/.vim/ftplugin/resolv.vim<CR>
    setlocal spellfile=~/.vim/spell/en.utf-8.add,~/.vim/spell/resolv.utf-8.add
endif

augroup resolv_1
    autocmd!
    if has('nvim')
	autocmd BufEnter,BufWritePost <buffer> source ~/.local/share/nvim/site/ftplugin/resolv.vim
    else
	autocmd BufEnter,BufWritePost <buffer> source ~/.vim/ftplugin/resolv.vim
    endif

augroup END

hi resolvNameserver cterm=none ctermfg=3 ctermbg=none
hi resolvIPNameserver cterm=none ctermfg=5 ctermbg=none
hi resolvHostnameSearch cterm=none ctermfg=2 ctermbg=none

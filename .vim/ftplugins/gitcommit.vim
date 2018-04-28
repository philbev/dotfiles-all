setlocal spelllang=en
setlocal spell

if has('nvim')
    nnoremap <buffer> <F10> :edit ~/.local/share/nvim/site/ftplugin/gitcommit.vim<cr>
    nnoremap <buffer> <F22> :source ~/.local/share/nvim/site/ftplugin/gitcommit.vim<cr>
    setlocal spellfile=~/.local/share/nvim/site/spell/en.utf-8.add,~/.local/share/nvim/site/spell/gitcommit.utf-8.add
else
    nnoremap <buffer> <F10> :edit ~/.vim/ftplugin/gitcommit.vim<cr>
    nnoremap <buffer> <S-F10> :source ~/.vim/ftplugin/gitcommit.vim<cr>
    setlocal spellfile=~/.vim/spell/en.utf-8.add,~/.vim/spell/gitcommit.utf-8.add
endif

augroup git_commit
    autocmd!
    if has('nvim')
	autocmd BufEnter,BufWritePost <buffer> source ~/.local/share/nvim/site/ftplugin/gitcommit.vim
    else
	autocmd BufEnter,BufWritePost <buffer> source ~/.vim/ftplugin/gitcommit.vim
    endif
augroup END

setlocal textwidth=72
hi Cursorline guibg=NONE ctermbg=NONE


if has('nvim')
    nnoremap <buffer> <F10> :edit ~/.local/share/nvim/site/ftplugin/snippet.vim<CR>
    nnoremap <buffer> <F22> :source ~/.local/share/nvim/site/ftplugin/snippet.vim<CR>
else
    nnoremap <buffer> <F10> :edit ~/.vim/ftplugin/snippet.vim<CR>
    nnoremap <buffer> <S-F10> :source ~/.vim/ftplugin/snippet.vim<CR>
endif

augroup snippet_1
    autocmd!
    if has('nvim')
	autocmd BufEnter,BufWritePost <buffer> source ~/.local/share/nvim/site/ftplugin/snippet.vim
    else
	autocmd BufEnter,BufWritePost <buffer> source ~/.vim/ftplugin/snippet.vim
    endif
augroup END

setlocal foldcolumn=4
nnoremap <buffer>  zA


if has('nvim')
    nnoremap <buffer> <F10> :edit ~/.local/share/nvim/site/after/ftplugin/snippet.vim<CR>
    nnoremap <buffer> <F22> :source ~/.local/share/nvim/site/after/ftplugin/snippet.vim<CR>
else
    nnoremap <buffer> <F10> :edit ~/.vim/after/ftplugin/snippet.vim<CR>
    nnoremap <buffer> <S-F10> :source ~/.vim/after/ftplugin/snippet.vim<CR>
endif

augroup snippet_1
    autocmd!
    if has('nvim')
	autocmd BufWritePost <buffer> source ~/.local/share/nvim/site/after/ftplugin/snippet.vim
    else
	autocmd BufWritePost <buffer> source ~/.vim/after/ftplugin/snippet.vim
    endif
augroup END

setlocal foldcolumn=4
nnoremap <buffer>  zA


setlocal spelllang=en
if has('nvim')
    nnoremap <buffer> <F10> :edit ~/.local/share/nvim/site/after/ftplugin/vim.vim<CR>
    nnoremap <buffer> <F22> :source ~/.local/share/nvim/site/after/ftplugin/vim.vim<CR>
    setlocal spellfile=~/.local/share/nvim/site/spell/en.utf-8.add,~/.local/share/nvim/site/spell/nvim.utf-8.add
else
    nnoremap <buffer> <F10> :edit ~/.vim/after/ftplugin/vim.vim<CR>
    nnoremap <buffer> <S-F10> :source ~/.vim/after/ftplugin/vim.vim<CR>
    setlocal spellfile=~/.vim/spell/en.utf-8.add,~/.vim/spell/vim.utf-8.add
endif

augroup vim_1
    autocmd!
    if has('nvim')
	autocmd BufWritePost <buffer> source ~/.local/share/nvim/site/after/ftplugin/nvim.vim
    else
	autocmd BufWritePost <buffer> source ~/.vim/after/ftplugin/nvim.vim
    endif
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""
"	ABBREVIATIONS GO HERE			"
"""""""""""""""""""""""""""""""""""""""""""""""""
inoreabbrev <buffer> iab inoreabbrev <buffer>
inoreabbrev <buffer> inorea inoreabbrev <buffer>
inoreabbrev <buffer> set setlocal
inoreabbrev <buffer> nmap nnoremap <buffer>
inoreabbrev <buffer> nnoremap nnoremap <buffer>
inoreabbrev <buffer> vmap vnoremap <buffer>
inoreabbrev <buffer> vnoremap vnoremap <buffer>
inoreabbrev <buffer> cmap cnoremap <buffer>
inoreabbrev <buffer> cnoremap cnoremap <buffer>

setlocal spelllang=en
if has('nvim')
    nnoremap <buffer> <F10> :edit ~/.local/share/nvim/site/ftplugin/txt.vim<CR>
    nnoremap <buffer> <F22> :source ~/.local/share/nvim/site/ftplugin/txt.vim<CR>
    setlocal spellfile=~/.local/share/nvim/site/spell/en.utf-8.add,~/.local/share/nvim/site/spell/txt.utf-8.add
else
    nnoremap <buffer> <F10> :edit ~/.vim/ftplugin/txt.vim<CR>
    nnoremap <buffer> <S-F10> :source ~/.vim/ftplugin/txt.vim<CR>
    setlocal spellfile=~/.vim/spell/en.utf-8.add,~/.vim/spell/txt.utf-8.add
endif

augroup txt
    autocmd!
    if has('nvim')
	autocmd BufEnter,BufWritePost <buffer> source ~/.local/share/nvim/site/ftplugin/txt.vim
    else
	autocmd BufEnter,BufWritePost <buffer> source ~/.vim/ftplugin/txt.vim
    endif
augroup END

setlocal tabstop=8
setlocal shiftwidth=4
setlocal noexpandtab
"setlocal textwidth=0
"autocmd FileType text setlocal textwidth=0
"setlocal spell spelllang=en


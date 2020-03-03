setlocal spelllang=en
if has('nvim')
    nnoremap <buffer> <F10> :edit ~/.local/share/nvim/site/after/ftplugin/text.vim<CR>
    nnoremap <buffer> <F22> :source ~/.nvim/after/ftplugin/text.vim<CR>
    setlocal spellfile=~/.local/share/nvim/site/spell/en.utf-8.add,~/.local/share/nvim/site/spell/text.utf-8.add
    setlocal dictionary+=/usr/share/dict/american-english
    call deoplete#custom#source(
    \ 'dictionary', 'min_pattern_length', 3)
else
    nnoremap <buffer> <F10> :edit ~/.vim/after/ftplugin/text.vim<CR>
    nnoremap <buffer> <S-F10> :source ~/.vim/after/ftplugin/text.vim<CR>
    setlocal spellfile=~/.vim/spell/en.utf-8.add,~/.vim/spell/text.utf-8.add
endif

augroup text_1
    autocmd!
    if has('nvim')
	autocmd BufWritePost <buffer> source ~/.local/share/nvim/site/after/ftplugin/text.vim
    else
	autocmd BufWritePost <buffer> source ~/.vim/after/ftplugin/text.vim
    endif
augroup END

setlocal tabstop=8
setlocal shiftwidth=4
setlocal noexpandtab
"setlocal textwidth=0
"autocmd FileType text setlocal textwidth=0
"setlocal spell spelllang=en


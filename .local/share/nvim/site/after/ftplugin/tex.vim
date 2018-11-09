setlocal spelllang=en
if has('nvim')
	nnoremap <buffer> <F10> :edit ~/.local/share/nvim/site/after/ftplugin/tex.vim<CR>
	nnoremap <buffer> <F22> :source ~/.local/share/nvim/site/after/ftplugin/tex.vim<CR>
setlocal spellfile=~/.local/share/nvim/site/spell/en.utf-8.add,~/.local/share/nvim/site/spell/tex.utf-8.add
else
	nnoremap <buffer> <F10> :edit ~/.vim/after/ftplugin/tex.vim<CR>
	nnoremap <buffer> <S-F10> :source ~/.vim/after/ftplugin/tex.vim<CR>
setlocal spellfile=~/.vim/spell/en.utf-8.add,~/.vim/spell/tex.utf-8.add
endif

augroup tex_1
	autocmd!
	if has('nvim')
	autocmd BufWritePost <buffer> source ~/.local/share/nvim/site/after/ftplugin/tex.vim
    else
	autocmd BufWritePost <buffer> source ~/.vim/after/ftplugin/tex.vim
    endif
augroup END

let g:tex_flavor="latex"

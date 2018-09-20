setlocal spelllang=en
if has('nvim')
    nnoremap <buffer> <F10> :edit ~/.local/share/nvim/site/after/ftplugin/help.vim<CR>
    nnoremap <buffer> <F22> :source ~/.local/share/nvim/site/after/ftplugin/help.vim<CR>
    setlocal spellfile=~/.local/share/nvim/site/spell/en.utf-8.add,~/.local/share/nvim/site/spell/help.utf-8.add
else
    nnoremap <buffer> <F10> :edit ~/.vim/after/ftplugin/help.vim<CR>
    nnoremap <buffer> <S-F10> :source ~/.vim/after/ftplugin/help.vim<CR>
    setlocal spellfile=~/.vim/spell/en.utf-8.add,~/.vim/spell/help.utf-8.add
endif

augroup help_1
    autocmd!
    if has('nvim')
	autocmd BufWritePost <buffer> source ~/.local/share/nvim/site/after/ftplugin/help.vim
    else
	autocmd BufWritePost <buffer> source ~/.vim/after/ftplugin/help.vim
    endif
augroup END

nmap <buffer> <cr> 
nnoremap <buffer> <Insert> /\|.\{-1,\}\|<cr>:nohlsearch<CR>
nnoremap <buffer> s /\|\zs\S\+\ze\|<CR>
nnoremap <buffer> <space> 
nnoremap <buffer> b 
nnoremap <buffer> <S-tab> /mode<CR>
"nnoremap <buffer> [1;3D 
nnoremap <buffer> <M-Left> 

"Next 3 lines display vertical bars and asterisks in help
set conceallevel=0  "Actually set in /usr/share/vim/vim74/after/ftplugin/help.vim
hi link HelpBar Normal
hi link HelpStar Normal


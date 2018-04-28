setlocal spelllang=en
if has('nvim')
    nnoremap <buffer> <F10> :edit ~/.local/share/nvim/site/ftplugin/python.vim<CR>
    nnoremap <buffer> <F22> :source ~/.local/share/nvim/site/ftplugin/python.vim<CR>
setlocal spellfile=~/.local/share/nvim/site/spell/en.utf-8.add,~/.local/share/nvim/site/spell/python.utf-8.add
else
    nnoremap <buffer> <F10> :edit ~/.vim/ftplugin/python.vim<CR>
    nnoremap <buffer> <S-F10> :source ~/.vim/ftplugin/python.vim<CR>
setlocal spellfile=~/.vim/spell/en.utf-8.add,~/.vim/spell/python.utf-8.add
endif

augroup python_1
    autocmd!
if has('nvim')
    autocmd BufEnter,BufWritePost <buffer> source ~/.local/share/nvim/site/ftplugin/python.vim
else
    autocmd BufEnter,BufWritePost <buffer> source ~/.vim/ftplugin/python.vim
endif
augroup END

"inoremap <buffer> ( ()<Left>
"inoremap <buffer> { {}<Left>
"inoremap <buffer> ' ''<Left>
"inoremap <buffer> " ""<Left>
"inoremap <buffer> [ []<Left>
inoremap <buffer> <leader>p #!/usr/bin/python3
nnoremap <buffer> <leader>p I#!/usr/bin/python3<CR>

" Using terminal in nvim as :! commannds are causing problems
" with python input methods. This is documented as a bug in 
" neovim and will hopefully be fixed in the near future
if has('nvim')
    nnoremap <buffer> <F5> :w<bar>terminal /usr/bin/python3 %<cr>
    nnoremap <buffer> <M-p> :w<bar>terminal /usr/bin/python3 %<cr>
else
    nnoremap <buffer> <F5> :w<bar>!/usr/bin/python3 %<cr>
    nnoremap <buffer> <M-p> :w<bar>!/usr/bin/python3 %<cr>
endif


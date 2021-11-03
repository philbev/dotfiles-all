setlocal spelllang=en
if has('nvim')
    nnoremap <buffer> <F10> :edit ~/.local/share/nvim/site/after/ftplugin/lua.vim<CR>
    nnoremap <buffer> <F22> :source ~/.local/share/nvim/site/after/ftplugin/lua.vim<CR>
setlocal spellfile=~/.local/share/nvim/site/spell/en.utf-8.add,~/.local/share/nvim/site/spell/lua.utf-8.add
else
    nnoremap <buffer> <F10> :edit ~/.vim/after/ftplugin/lua.vim<CR>
    nnoremap <buffer> <S-F10> :source ~/.vim/after/ftplugin/lua.vim<CR>
setlocal spellfile=~/.vim/spell/en.utf-8.add,~/.vim/spell/lua.utf-8.add
endif

setlocal textwidth=80
setlocal updatetime=300
setlocal colorcolumn=80
setlocal cursorcolumn
colorscheme gruvbox8
"highlight ColorColumn guibg=#880000

augroup lua_1
    autocmd!
if has('nvim')
    autocmd BufWritePost <buffer> source ~/.local/share/nvim/site/after/ftplugin/lua.vim
else
    autocmd BufWritePost <buffer> source ~/.vim/after/ftplugin/lua.vim
endif
augroup END

inoremap <buffer> ( ()<Left>
inoremap <buffer> { {}<Left>
inoremap <buffer> ' ''<Left>
inoremap <buffer> " ""<Left>
inoremap <buffer> [ []<Left>
inoremap <buffer> <leader>l #!/usr/bin/lua
nnoremap <buffer> <leader>l I#!/usr/bin/lua<CR>

if has('nvim')
    nnoremap <buffer> <F5> :w<bar>terminal /usr/bin/lua %<cr><bar>a
    inoremap <buffer> <F5> <Esc>:w<bar>terminal /usr/bin/lua %<cr><bar>a
    nnoremap <buffer> <M-p> :w<bar>terminal /usr/bin/lua %<cr><bar>a
    inoremap <buffer> <M-p> <Esc>:w<bar>terminal /usr/bin/lua %<cr><bar>a
    nnoremap <buffer> <F8> : ALEFix<cr>
else
    nnoremap <buffer> <F5> :w<bar>!/usr/bin/lua %<cr><bar>a
    nnoremap <buffer> <M-p> :w<bar>!/usr/bin/lua %<cr><bar>a
endif


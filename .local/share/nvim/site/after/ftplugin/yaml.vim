setlocal spelllang=en
if has('nvim')
    nnoremap <buffer> <F10> :edit ~/.local/share/nvim/site/after/ftplugin/yaml.vim<CR>
    nnoremap <buffer> <F22> :source ~/.local/share/nvim/site/after/ftplugin/yaml.vim<CR>
setlocal spellfile=~/.local/share/nvim/site/spell/en.utf-8.add,~/.local/share/nvim/site/spell/yaml.utf-8.add
else
    nnoremap <buffer> <F10> :edit ~/.vim/after/ftplugin/yaml.vim<CR>
    nnoremap <buffer> <S-F10> :source ~/.vim/after/ftplugin/yaml.vim<CR>
setlocal spellfile=~/.vim/spell/en.utf-8.add,~/.vim/spell/yaml.utf-8.add
endif

setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2


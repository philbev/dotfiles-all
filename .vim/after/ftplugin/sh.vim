setlocal spelllang=en
scriptencoding utf-8

if has('nvim')
    nnoremap <buffer> <F10> :edit ~/.local/share/nvim/site/after/ftplugin/sh.vim<CR>
    nnoremap <buffer> <F22> :source ~/.local/share/nvim/site/after/ftplugin/sh.vim<CR>
setlocal spellfile=~/.local/share/nvim/site/spell/en.utf-8.add,~/.local/share/nvim/site/spell/bash.utf-8.add
else
    nnoremap <buffer> <F10> :edit ~/.vim/after/ftplugin/sh.vim<CR>
    nnoremap <buffer> <S-F10> :source ~/.vim/after/ftplugin/sh.vim<CR>
setlocal spellfile=~/.vim/spell/en.utf-8.add,~/.vim/spell/bash.utf-8.add
endif

augroup bash_1
    autocmd!
if has('nvim')
    autocmd BufWritePost <buffer> source ~/.local/share/nvim/site/after/ftplugin/sh.vim
else
    autocmd BufWritePost <buffer> source ~/.vim/after/ftplugin/sh.vim
endif
augroup END


"Back quotes converted to recommended format $(...)
inoremap <buffer> ` $()<esc>i

inoremap <buffer> " ""<left>
inoremap <buffer> ( ()<left>
inoremap <buffer> [ []<left>
inoremap <buffer> { {}<left>

"" FOLDING
""" LOCAL OPTIONS
setlocal foldenable
setlocal foldmethod=expr
setlocal foldcolumn=3
setlocal foldexpr=BashFolds()
setlocal foldtext=BashFoldText()
""" FOLDING KEY MAPPING
nnoremap <buffer> <tab> za
nnoremap <buffer> <S-tab> zA
nnoremap <buffer> j zMzjzo
nnoremap <buffer> k zMzkzo
""" FOLD FUNCTIONS
function! BashFolds()
    let thisline = getline(v:lnum)
    if match(thisline, '^## ') >= 0
	return '>1'
    elseif match(thisline, '^### ') >= 0
	return '>2'
    elseif match(thisline, '^#### ') >= 0
	return '>3'
    else
	return '='
    endif
endfunction

function! BashFoldText()
    let foldsize = (v:foldend-v:foldstart)
    return getline(v:foldstart).' ('.foldsize.' lines)'
endfunction


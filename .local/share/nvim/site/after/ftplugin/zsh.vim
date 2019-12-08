setlocal spelllang=en
if has('nvim')
    nnoremap <buffer> <F10> :edit ~/.local/share/nvim/site/after/ftplugin/zsh.vim<CR>
    nnoremap <buffer> <F22> :source ~/.local/share/nvim/site/after/ftplugin/zsh.vim<CR>
setlocal spellfile=~/.local/share/nvim/site/spell/en.utf-8.add,~/.local/share/nvim/site/spell/zsh.utf-8.add
else
    nnoremap <buffer> <F10> :edit ~/.vim/after/ftplugin/zsh.vim<CR>
    nnoremap <buffer> <S-F10> :source ~/.vim/after/ftplugin/zsh.vim<CR>
setlocal spellfile=~/.vim/spell/en.utf-8.add,~/.vim/spell/zsh.utf-8.add
endif

augroup zsh
    autocmd!
if has('nvim')
    autocmd BufWritePost <buffer> source ~/.local/share/nvim/site/after/ftplugin/zsh.vim
else
    autocmd BufWritePost <buffer> source ~/.vim/after/ftplugin/zsh.vim
endif
augroup END


"Back quotes converted to recommended format $(...)
inoremap <buffer> ` $()<esc>i

inoremap <buffer> " ""<left>
inoremap <buffer> ( ()<left>
inoremap <buffer> [ []<left>
inoremap <buffer> { {}<left>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             ABBREVIATIONS HERE                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

iabbrev black 16
iabbrev red 196
iabbrev green 46
iabbrev yellow 226
iabbrev blue 21
iabbrev magenta 201
iabbrev cyan 51
iabbrev white 231

"				FOLDING					    "

setlocal foldcolumn=4
setlocal foldmethod=expr
setlocal foldexpr=ZshFolds()

function! ZshFolds()
    let thisline = getline(v:lnum)
    if match(thisline, '^###.*###$') >= 0
	return '>3'
    elseif match(thisline, '^##.*##$') >= 0
	return '>2'
    elseif match(thisline, '^#.*#$') >= 0
	return '>1'
    else
	return '='
    endif
    return '1'
endfunction

function! ZshFoldText()
  let foldsize = (v:foldend-v:foldstart)
  return getline(v:foldstart).' ('.foldsize.' lines)'
endfunction
setlocal foldtext=ZshFoldText()


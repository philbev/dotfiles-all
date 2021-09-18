set spelllang=en
if has('nvim')
    nnoremap <buffer> <F10> :e ~/.local/share/nvim/site/after/ftplugin/markdown.vim<CR>
    "Line below commented out as vim-markdown plug-in interferes and loads
    "html.vim instead. Use :w or e: commands in edited files.
    "nnoremap <buffer> <S-F10> :so ~/.local/share/nvim/site/after/ftplugin/markdown.vim<CR>
    setlocal spellfile=~/.local/share/nvim/site/spell/en.utf-8.add,~/.local/share/nvim/site/spell/markdown.utf-8.add
else
    nnoremap <buffer> <F10> :e ~/.vim/after/ftplugin/markdown.vim<CR>|"             - <F10> Edit markdown .vim
    nnoremap <buffer> <S-F10> :so ~/.vim/after/ftplugin/markdown.vim<CR>|"            - <F10> Source markdown .vim
    setlocal spellfile=~/.vim/spell/en.utf-8.add,~/.local/share/nvim/site/spell/markdown.utf-8.add
endif

augroup markdown_1
    autocmd!
    if has('nvim')
        autocmd BufWritePost <buffer> source ~/.local/share/nvim/site/after/ftplugin/markdown.vim
        au BufEnter,BufReadPost  *.md,.markdown,.MD set conceallevel=0
    else
        autocmd BufWritePost <buffer> source ~/.vim/after/ftplugin/markdown.vim
    endif
augroup END

nnoremap <buffer> <M-1> :s/^ *//<CR>yyp:s/./=/g<CR>:nohlsearch<CR>|"        - <M-1> Header 1
inoremap <buffer> <M-1> <ESC>:s/^ *//<CR>yyp:s/./=/g<CR>:nohlsearch<CR>a|"  - <M-1> Header 1

nnoremap <buffer> <M-2> :s/^ *//<CR>yyp:s/./-/g<CR>:nohlsearch<CR>|"        - <M-2> Header 2
inoremap <buffer> <M-2> <ESC>:s/^ *//<CR>yyp:s/./-/g<CR>:nohlsearch<CR>a|"  - <M-2> Header 2

colorscheme desert
setlocal textwidth=80
setlocal colorcolumn=80

" Toggle folding in markdown files.
nnoremap <M-f> zA
nnoremap <buffer> <tab> za
nnoremap <buffer> <s-tab> zA
setlocal foldcolumn=4
setlocal foldmethod=expr
setlocal foldexpr=MarkdownFolds()

function! MarkdownFolds()
    let thisline = getline(v:lnum)
    if match(thisline, '^#### ') >= 0
        return '>4'
    elseif match(thisline, '^### ') >= 0
        return '>3'
    elseif match(thisline, '^## ') >= 0
        return '>2'
    elseif match(thisline, '^# ') >= 0
        return '>1'
    else
        return '='
    endif
    return '1'
endfunction

function! MarkdownFoldText()
  let foldsize = (v:foldend-v:foldstart)
  return getline(v:foldstart).' ('.foldsize.' lines)'
endfunction
setlocal foldtext=MarkdownFoldText()

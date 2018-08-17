" Set some sane defaults for snippet files

if exists('b:did_ftplugin')
    finish
endif
let b:did_ftplugin = 1

let s:save_cpo = &cpo
set cpo&vim

" Fold by syntax, but open all folds by default
setlocal foldmethod=syntax
setlocal foldlevel=99

setlocal commentstring=#%s

setlocal noexpandtab
setlocal autoindent nosmartindent nocindent

" Define match words for use with matchit plugin
" http://www.vim.org/scripts/script.php?script_id=39
if exists("loaded_matchit") && !exists("b:match_words")
  let b:match_ignorecase = 0
  let b:match_words = '^snippet\>:^endsnippet\>,^global\>:^endglobal\>,\${:}'
  let s:set_match_words = 1
endif

" Add TagBar support
let g:tagbar_type_snippets = {
            \ 'ctagstype': 'UltiSnips',
            \ 'kinds': [
                \ 's:snippets',
            \ ],
            \ 'deffile': expand('<sfile>:p:h:h') . '/ctags/UltiSnips.cnf',
        \ }

" don't unset g:tagbar_type_snippets, it serves no purpose
let b:undo_ftplugin = "
            \ setlocal foldmethod< foldlevel< commentstring<
            \|setlocal expandtab< autoindent< smartindent< cindent<
            \|if get(s:, 'set_match_words')
                \|unlet! b:match_ignorecase b:match_words s:set_match_words
            \|endif
            \"

let &cpo = s:save_cpo
unlet s:save_cpo

if has('nvim')
    nnoremap <buffer> <F10> :edit ~/.local/share/nvim/site/ftplugin/snippets.vim<CR>
    nnoremap <buffer> <F22> :source ~/.local/share/nvim/site/ftplugin/snippets.vim<CR>
else
    nnoremap <buffer> <F10> :edit ~/.vim/ftplugin/snippets.vim<CR>
    nnoremap <buffer> <S-F10> :source ~/.vim/ftplugin/snippets.vim<CR>
endif

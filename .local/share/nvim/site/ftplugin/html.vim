"File /home/philbev/.vim/ftplugins/html.vim
setlocal spelllang=en
if has('nvim')
    nnoremap <buffer> <F10> :edit ~/.local/share/nvim/site/ftplugin/html.vim<CR>
    nnoremap <buffer> <F22> :source ~/.local/share/nvim/site/ftplugin/html.vim<CR>
    setlocal spellfile=~/.local/share/nvim/site/spell/en.utf-8.add,~/.local/share/nvim/site/spell/html.utf-8.add
else
    nnoremap <buffer> <F10> :edit ~/.vim/ftplugin/html.vim<CR>
    nnoremap <buffer> <S-F10> :source ~/.vim/ftplugin/html.vim<CR>
    setlocal spellfile=~/.vim/spell/en.utf-8.add,~/.vim/spell/html.utf-8.add
endif

augroup html_1
    autocmd!
    if has('nvim')
	autocmd BufWritePost <buffer> source ~/.local/share/nvim/site/ftplugin/html.vim
    else
	autocmd BufWritePost <buffer> source ~/.vim/ftplugin/html.vim
    endif
augroup END

"Anchor tag <Alt>-a
nnoremap <buffer> <M-a> I<a href="http://"><Esc>A</a><Esc>F<i
inoremap <buffer> <M-a> <a href="http://"></a><Esc>F>a
vnoremap <buffer> <M-a> di<a href="http://"></a><Esc>F>pF/a

"BEGIN new-line <Alt>-b, <Alt>-r
nnoremap <buffer> <M-b><M-r> A<br /><Esc>
inoremap <buffer> <M-b><M-r> <Esc>A<br />
vnoremap <buffer> <M-b><M-r> da<br /><Esc>3hP

"BOLD - <Alt>-b, <Alt>-o
nnoremap <buffer> <M-b><M-o> i<b></b><Esc>3hi
inoremap <buffer> <M-b><M-o> <b></b><Esc>3hi
vnoremap <buffer> <M-b><M-o> di<b><Esc>pa</b><Esc>

"CODE tag <Alt>-c
nnoremap <buffer> <M-c><M-o> i<code></code><Esc>6hi
inoremap <buffer> <M-c><M-o> <code><cr><cr></code><cr><Esc>2ka
vnoremap <buffer> <M-c><M-o> di<code><cr><C-R>"<cr></code><Esc>

"HEADER 1 to HEADER 6 (<Alt>-1 to <Alt>-6)
nnoremap <buffer> <M-1> I<h1><Esc>A</h1><Esc>
nnoremap <buffer> <M-2> I<h2><Esc>A</h2><Esc>
nnoremap <buffer> <M-3> I<h3><Esc>A</h3><Esc>
nnoremap <buffer> <M-4> I<h4><Esc>A</h4><Esc>
nnoremap <buffer> <M-5> I<h5><Esc>A</h5><Esc>
nnoremap <buffer> <M-6> I<h6><Esc>A</h6><Esc>

inoremap <buffer> <M-1> <h1></h1><Esc>5ha
inoremap <buffer> <M-2> <h2></h2><Esc>5ha
inoremap <buffer> <M-3> <h3></h3><Esc>5ha
inoremap <buffer> <M-4> <h4></h4><Esc>5ha
inoremap <buffer> <M-5> <h5></h5><Esc>5ha
inoremap <buffer> <M-6> <h6></h6><Esc>5ha

vnoremap <buffer> <M-1> di<h1></h1><Esc>5hp
vnoremap <buffer> <M-2> di<h2></h2><Esc>5hp
vnoremap <buffer> <M-3> di<h3></h3><Esc>5hp
vnoremap <buffer> <M-4> di<h4></h4><Esc>5hp
vnoremap <buffer> <M-5> di<h5></h5><Esc>5hp
vnoremap <buffer> <M-6> di<h6></h6><Esc>5hp

"List item <Alt>-l,i or <Alt>-l,<Alt>-i
nnoremap <buffer> <M-l>i I<li><Esc>A</li><Esc>
inoremap <buffer> <M-l>i <li></li><Esc>F>a
vnoremap <buffer> <M-l>i di<li></li><Esc>F>p
nnoremap <buffer> <M-l><M-i> I<li><Esc>A</li><Esc>
inoremap <buffer> <M-l><M-i> <li></li><Esc>F>a
vnoremap <buffer> <M-l><M-i> di<li></li><Esc>F>p

"Ordered list <Alt>-l,o or <Alt>-l,<Alt>-o
nnoremap <buffer> <M-l>o i<ol><CR><CR></ol><Esc>kI<li></li><Esc>4hi
inoremap <buffer> <M-l>o <ol><CR><CR></ol><Esc>kI<li></li><Esc>4hi
vnoremap <buffer> <M-l>o di<ol><CR><CR></ol><Esc>kpI<li><Esc>A</li><Esc>
nnoremap <buffer> <M-l><M-o> i<ol><CR><CR></ol><Esc>kI<li></li><Esc>4hi
inoremap <buffer> <M-l><M-o> <ol><CR><CR></ol><Esc>kI<li></li><Esc>4hi
vnoremap <buffer> <M-l><M-o> di<ol><CR><CR></ol><Esc>kpI<li><Esc>A</li><Esc>

"P tag <Alt>-p
nnoremap <buffer> <M-p> I<p><Esc>A</p><Esc>
inoremap <buffer> <M-p> <p></p><Esc>3hi
vnoremap <buffer> <M-p> di<p></p><Esc>4hp

"PRE tag <Alt>-p, <Alt>-r
nnoremap <buffer> <M-p><M-r> I<pre><Esc>A</pre><Esc>
inoremap <buffer> <M-p><M-r> <pre><cr><cr></pre><cr><Esc>2ka
vnoremap <buffer> <M-p><M-r> di<pre><CR></pre><Esc>6hp

"Span tag <Alt>+s
nnoremap <buffer> <M-s> I<span><Esc>A</span><Esc>6hi
inoremap <buffer> <M-s> <span></span><Esc>6hi
vnoremap <buffer> <M-s> di<span><Esc>pa</span><Esc>

"TABLES - Starts with <alt>-t
"Table <Alt>-t, <Alt>-a
nnoremap <buffer> <M-t><M-a> I<table><cr><cr></table><Esc>
inoremap <buffer> <M-t><M-a> <table><cr><cr></table><Esc>ka
vnoremap <buffer> <M-t><M-a> dI<table><cr><cr></table><Esc>kp
"Table Header <Alt>-t, <Alt>-h
nnoremap <buffer> <M-t><M-h> i<th></th><Esc>4hi
inoremap <buffer> <M-t><M-h> <th></th><Esc>4hi
vnoremap <buffer> <M-t><M-h> di<th></th><Esc>5hpf>l
"Table Data <Alt>-t, <Alt>-d
nnoremap <buffer> <M-t><M-d> i<td></td><Esc>4hi
inoremap <buffer> <M-t><M-d> <td></td><Esc>4hi
vnoremap <buffer> <M-t><M-d> di<td></td><Esc>5hpf>l
"Table Row <Alt>-t, <Alt>-r
nnoremap <buffer> <M-t><M-r> I<tr><Esc>A</tr><Esc>
inoremap <buffer> <M-t><M-r> <tr></tr><Esc>5ha
vnoremap <buffer> <M-t><M-r> di<tr></tr><Esc>5hpf>l

"Unordered list <Alt>-l,u or <Alt>-l,<Alt>-u
nnoremap <buffer> <M-l>u i<ul><CR><CR></ul><Esc>kI<li></li><Esc>4hi
inoremap <buffer> <M-l>u <ul><CR><CR></ul><Esc>kI<li></li><Esc>4hi
vnoremap <buffer> <M-l>u di<ul><CR><CR></ul><Esc>kpI<li><Esc>A</li><Esc>
nnoremap <buffer> <M-l><M-u> i<ul><CR><CR></ul><Esc>kI<li></li><Esc>4hi
inoremap <buffer> <M-l><M-u> <ul><CR><CR></ul><Esc>kI<li></li><Esc>4hi
vnoremap <buffer> <M-l><M-u> di<ul><CR><CR></ul><Esc>kpI<li><Esc>A</li><Esc>

"HTML Entities
"Non-breaking space <Alt>+.
nnoremap <buffer> <M-.> a&nbsp;<Esc>
inoremap <buffer> <M-.> &nbsp;

"Greater than (>) <Alt>+>
nnoremap <buffer> <M->> a&gt;<Esc>
inoremap <buffer> <M->> &gt;

"Less than (<) <Alt>+<
nnoremap <buffer> <M-<> a&lt;<Esc>
inoremap <buffer> <M-<> &lt;

"Pound sign (£) <Alt>+£
nnoremap <buffer> <M-£> a&pound;
inoremap <buffer> <M-£> &pound;

"Euro sign (€)
nnoremap <buffer> € a&euro;
inoremap <buffer> € &euro;


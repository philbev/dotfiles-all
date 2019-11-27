# Zsh Tips and tricks {{{1

To find out if if an option is set or not:
```bash
    echo $options[<option name>]
```
## History Expansion{{{2
###  ``` ^<string to be omitted>```{{{3
At the command line the *^<string>*, the *string* following the *^* character
is removed from the previous command in the history. E.g:-
>   % cal 1222 1995

outputs
>   cal: illegal month value: use 1-12

>    % ^22

outputs

```bash
    December 1995 
Mo Tu We Th Fr Sa Su
             1  2  3
 4  5  6  7  8  9 10
11 12 13 14 15 16 17
18 19 20 21 22 23 24
25 26 27 28 29 30 31
```                    
### ```!:X```{{{3
Where X is:-
```bash
       0      The first input word (command).
       n      The nth argument.
       ^      The first argument.  That is, 1.
       $      The last argument.
       %      The word matched by (the most recent) ?str search.
       x-y    A range of words; x defaults to 0.
       *      All the arguments, or a null value if there are none.
       x*     Abbreviates `x-$'.
       x-     Like `x*' but omitting word $.
```

vim:foldenable:foldmethod=marker

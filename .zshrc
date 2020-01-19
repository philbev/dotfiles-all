# ~/.zshrc: Configuration file for zsh.
# Lines beginning with a single '#' are comments as usual.
# Lines beginning with a '##' are level 1 folds.
# Lines beginning with a '###' are level 2 folds etc.
#
## LINES CONFIGURED BY ZSH-NEWUSER-INSTALL
HISTFILE=~/.histfile
HISTSIZE=1500
SAVEHIST=1500
setopt appendhistory autocd extendedglob
unsetopt beep nomatch
bindkey -v
# End of lines configured by zsh-newuser-install



# The following lines were added by compinstall
zstyle :compinstall filename '/home/phil/.zshrc'

autoload -Uz compinit
compinit

autoload -Uz promptinit
promptinit
#prompt fire red magenta blue white white

# End of lines added by compinstall
## KEY BINDINGS
bindkey -v
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "\e[A" up-line-or-beginning-search
bindkey "       " expand-or-complete-prefix     # <Tab> key
bindkey "\e[B" down-line-or-beginning-search
bindkey "\eh" run-help
bindkey '\eq' push-line-or-edit
bindkey "\e." insert-last-word
bindkey "[3~" delete-char             # <Del> key
bindkey "[F" end-of-line              # <End> key
bindkey "[H" beginning-of-line        # <Home> key
bindkey "" history-incremental-search-backward
bindkey -s '`' '$()\ei'
if [[ -f /etc/arch-release ]]; then     # pacman not in Slackware.
    bindkey -s "p" "sudo pacman --color=auto -S"   # <Alt-p>
fi

## OPTIONS AND FUNCTIONS


# For autocompletion with an arrow-key driven interface.
zstyle ':completion:*' menu select
# For autocompletion of command line switches for aliases.
setopt COMPLETE_ALIASES
# For case insensitive auto completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

if [[ $TERM = linux ]]; then
    setfont /usr/share/kbd/consolefonts/iso01-12x22.psfu
fi

autoload -Uz gitx
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
setopt hist_ignore_space
# Autopushd options
setopt autopushd
setopt pushdsilent
setopt pushdminus
setopt pushdignoredups
source ~/.colors

autoload -Uz run-help
autoload -Uz run-help-git
autoload -Uz run-help-ip
autoload -Uz run-help-sudo
unalias 'run-help' 2>/dev/null
alias help=run-help



## VARIABLES (PARAMETERS)

fpath=( ~/.zfuncs "${fpath[@]}" )
path=(~/.gem/ruby/2.5.0/bin "${path[@]}")
export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
export LANG=en_GB.UTF-8
export EDITOR=/usr/bin/nvim
export SHELLCHECK_OPTS="-e SC1090 -e SC2154 -e SC2012"
# Less colours. Needs 'source-highlight' package to be installed.
export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
export LESS="-eFRX"
export GREP_COLORS='ms=01;38;5;196:fn=01;38;5;201:ln=01;38;5;46'
export HELPDIR=/usr/share/zsh/$ZSH_VERSION/help
export DIRSTACKSIZE=20          # Needed for autopushd.

autoload precmd
precmd

## ALIASES

alias ..="cd .."
alias a=alias
alias cda='cd /usr/local/audio/mp3'
alias cdd='cd /usr/local/docs'
alias cdp='cd /usr/local/pictures'
alias cdr='cd /usr/local/downloads/repositories'
alias cdv='cd /usr/local/videos'
alias cdw='cd /usr/local/downloads'
alias dirv='dirs -v'
alias dot='. $HOME/.zshrc'
alias ej0='eject -T /dev/sr0'
alias ej1='eject -T /dev/sr1'
alias ej='eject -T /dev/sr0'
alias em='emacs -nw'
alias emkeys='cat /usr/local/docs/myinfo/emacs-editing-commands.txt'
alias f.='find . -name'
alias f='find / -name'
alias gitl='git log --decorate --oneline --graph'
alias grep='grep --color=auto --directories=skip'
alias ifc='/sbin/ifconfig'
alias lh='ls -lhF --color --group-directories-first | less'
alias lph='lp -o orientation-requested=4'
alias lpp='lp -o prettyprint'
alias lpph='lp -o orientation-requested=4 -o prettyprint'
alias lsblk='lsblk -o model,type,name,fstype,size,label,mountpoint,partlabel'
alias startx='startx -- -nolisten tcp'
alias v=nvim
alias vi=nvim
alias vim='TERM=xterm-256color vim'
alias vib='vi $HOME/.bashrc'
alias vie='vi $HOME/.emacs.d/init.el'
alias vii='nvim $HOME/.config/nvim/init.vim'
alias vil='vi $HOME/.zlogout'
alias vip='vi $HOME/.zprofile'
alias vin='nvim $HOME/.config/nvim/init.vim'
alias viv='vim $HOME/.vimrc'
alias viz='nvim $HOME/.zshrc'
alias -s md=nvim
alias -s pdf=okular
alias -s tex=nvim
alias -s txt=nvim


## PROMPTING


# Show vim status when in vi mode.
function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/** %SNORMAL%s **}/(main|viins)/** INSERT **}"
    RPS2=$RPS1
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

prompt="%B%F{226}(${BRANCH})%F{196}[%F{51}%n%F{196}:%F{201}%2~%F{196}]%f%b%% "

# Slackware and Arch Linux store powerlevel9k files in different directories.
#[[ -f ~/powerlevel9k/powerlevel9k.zsh-theme ]] && source ~/powerlevel9k/powerlevel9k.zsh-theme
#[[ -f /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme ]] && source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
#
#POWERLEVEL9K_PROMPT_ON_NEWLINE=false
#POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='white'
#POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='red'
#POWERLEVEL9K_DIR_HOME_FOREGROUND='yellow'
#POWERLEVEL9K_DIR_HOME_BACKGROUND='red'
#POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='white'
#POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='red'


## FUNCTIONS
### man()
# Colourisation of man pages.
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[38;2;0;255;0m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

### dh()
dh () {
    du "$@" -d 1 -xh | sort -rh
}

### rsync-italian()
rsync-italian () {
    rsync -avh --progress --delete  /usr/local/docs/italian/ /home/philbev/Dropbox/italian
}

### rsync-german()
rsync-german () {
    rsync -avh --progress --delete /usr/local/docs/german/ /home/philbev/Dropbox/german
}

### g()
g () {
    g++ -o ${1%.cpp} "$@"
}

### gh()
gh () {
    if [[ $# != 1 ]]; then
        echo "grep for <search-item> in history:-"
        echo "Usage: gh <search-item>"
    fi
    history | grep "$@" 2>/dev/null
}


### l()
l () {
    ls -lF --color --group-directories-first "$@" | less
}

### la()
la () {
    ls -AlvF --color=auto --group-directories-first  "$@" | less
}

### ll()
ll () {

    ls -lF --color=auto --group-directories-first "$@" | less
}

### lm()
lm () {

    ls -lF --color=auto --group-directories-first "$@" | more
}

### inf()
inf () {
    info coreutils "$@" "invocation"
}

# This needs to be at the end of the file as something else is overwriting it.
# Powerlevel9k seems to be the main culprit.
export LC_CTYPE=en_GB.UTF-8

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1500
SAVEHIST=1500
setopt appendhistory autocd extendedglob
unsetopt beep nomatch
bindkey -e
# End of lines configured by zsh-newuser-install



# The following lines were added by compinstall
zstyle :compinstall filename '/home/phil/.zshrc'

autoload -Uz compinit
compinit

autoload -Uz promptinit
promptinit
#prompt fire red magenta blue white white

# End of lines added by compinstall

# For autocompletion with an arrow-key driven interface.
zstyle ':completion:*' menu select

# For autocompletion of command line switches for aliases.
setopt COMPLETE_ALIASES


if [[ $TERM = linux ]]; then
	setfont /usr/share/kbd/consolefonts/iso01-12x22.psfu
fi

PS1=$'%{\e[1;38;2;255;255;0m%}[%n@%M]%% %{\e[0m%}'
RPS1=$'%{\e[1;38;2;255;0;0m%}[%w%D{th %b %Y} %T]%{\e[0m%}'
fpath=( ~/.zfuncs "${fpath[@]}" )
#autoload -Uz hello	    # This is just an example.
#autoload -Uz print_dir
#precmd_functions=(print_dir)


export LESS="-eFRX"
export LANG=en_GB.UTF-8

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "\e[A" up-line-or-beginning-search 
bindkey "\e[B" down-line-or-beginning-search


###################################################################################################
#				ALIASES								  #
###################################################################################################
alias ..="cd .."
alias a=alias
alias cda='cd /usr/local/audio/mp3'
alias cdd='cd /usr/local/docs'
alias cdp='cd /usr/local/pictures'
alias cdr='cd /usr/local/downloads/repositories'
alias cdv='cd /usr/local/videos'
alias cdw='cd /usr/local/downloads'
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
alias l='ls -lF --color --group-directories-first | less'
alias la='ls -alF --color --group-directories-first | less'
alias ll='ls -AlF --color --group-directories-first | less'
alias lm='ls -AlF --color --group-directories-first | more'
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

bindkey "[3~" delete-char		# <Del> key
bindkey "[F" end-of-line		# <End> key
bindkey "[H" beginning-of-line	# <Home> key
if [[ -f /etc/arch-release ]]; then	# pacman not in Slackware.
    bindkey -s "p" "sudo pacman --color=auto -S"   # <Alt-p>
fi

# Slackware and Arch Linux store powerlevel9k files in different directories.
if [[ -f /etc/slackware-version ]]; then
    source  ~/powerlevel9k/powerlevel9k.zsh-theme
else
    source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
fi

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='white'
POWERLEVEL9K_DIR_HOME_FOREGROUND='yellow'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='white'


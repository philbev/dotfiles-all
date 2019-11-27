#!/usr/bin/bash
# MY /home/.bashrc INITIALISATION FILE

###################################################################################################
#	    SOURCED FILES									  #
###################################################################################################

# Load all my functions from $HOME/.functions.sh
if [[ -f $HOME/.functions.sh ]]; then
    . "$HOME"/.functions.sh
fi

if [[ -f /usr/share/bash-completion/bash_completion ]]; then
    source /usr/share/bash-completion/bash_completion
fi

# Give some colour to man pages.
if [[ -f ~/.less_colours.sh	]]; then
	source ~/.less_colours.sh
fi

# Define some variables to be used for colours
if [[ -f ~/.colors	]]; then
	source ~/.colors
fi

# To reflect status of git.
if [[ -f ~/.set_prompt.sh ]]; then
    source ~/.set_prompt.sh
fi

###################################################################################################
#			ENVIRONMENT VARIABLES							  #
###################################################################################################

if [[ $USER != root ]]; then
    export LS_OPTIONS=${LS_OPTIONS/auto/always}
fi
export PATH=$PATH:/usr/local/bin/android-studio/bin:/usr/local/bin/android-sdk-linux/platform-tools	# Needed for Android SDK
export LANG="en_GB.UTF-8"

# Need to source ~/.bashrc every time a directory is changed so as to get the status of git.
function cd() {
    new_directory="$*";
    if [ $# -eq 0 ]; then
        new_directory=${HOME};
    fi;
    builtin cd "${new_directory}" && . ~/.bashrc
}

ps_local="\[$bold$yellowfg\]$(is_git_dir)\[$bold$cyanfg\][\u:\w]\$ \[\033[0m\]"
ps_ssh="\033[1;35m(\h) $ps_local"
who -m | grep -q '([^:]\+)' && PS1="$ps_ssh" || PS1="$ps_local"
export PS1
export SHELLCHECK_OPTS="-e SC1090 -e SC2154 -e SC2012"
export LESS="-eFRX"
export HISTCONTROL=ignoredups:ignorespace:erasedups
export HISTTIMEFORMAT="%c: "
export QUEUEDIR=/home/philbev/.sbopkg/queues	# Needed for Sbopkg
export HISTFILESIZE=50000
export HISTSIZE=1000
export HISTIGNORE=l:ll:lm:c:a:h:la:lh
export PROMPT_COMMAND="history -a;source ~/.set_prompt.sh"
export PROMPT_DIRTRIM=3
export REPOS=/usr/local/downloads/repositories
export GREP_COLORS='ms=01;38;5;196:fn=01;38;5;201:ln=01;38;5;46'
export GVFS_DISABLE_FUSE=1
export CXXFLAGS='-std=c++14 -g -Wall'
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export SLACK_DIR=/usr/local/downloads/repositories/slackware64/latest
export EDITOR=nvim
shopt -s histappend
shopt -s checkwinsize	#Hopefully this will stop bash from messing up my screen occasionally.



###################################################################################################
#				ALIASES								  #
###################################################################################################
alias ..="cd .."
alias a=alias
#alias c=clear
alias cda='cd /usr/local/audio/mp3'
alias cdd='cd /usr/local/docs'
alias cdp='cd /usr/local/pictures'
alias cdr='cd /usr/local/downloads/repositories'
alias cdv='cd /usr/local/videos'
alias cdw='cd /usr/local/downloads'
alias dot='. $HOME/.bash_profile'
alias dot='. $HOME/.bashrc'
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
alias lh='ls -lhF --color --group-directories-first'
alias lph='lp -o orientation-requested=4'
alias lpp='lp -o prettyprint'
alias lpph='lp -o orientation-requested=4 -o prettyprint'
alias lsblk='lsblk -o model,type,name,fstype,size,label,mountpoint,partlabel'
alias startx='startx -- -nolisten tcp'
alias v=nvim
alias vi=nvim
alias vim='TERM=xterm-256color vim'
alias vib='vi $HOME/.bashrc'
alias vie='vi $HOME/.emacs'
alias vii='nvim $HOME/.config/nvim/init.vim'
alias vil='vi $HOME/.bash_logout'
alias vip='vi $HOME/.bash_profile'
alias vin='nvim $HOME/.config/nvim/init.vim'
alias viv='vim $HOME/.vimrc'



###################################################################################################
#				FUNCTIONS							  #
###################################################################################################

# Let's back-up okular bookmark file to directory where it will not be deleted when KDE
# is upgraded.
if [[ -f /etc/slackver-version ]]; then		# Only if running Slacware OS.
    slackver=$(sed 's/Slackware //' </etc/slackware-version)
    if [ ! -d /usr/local/backups/okular-"$slackver" ]; then
	mkdir -vp /usr/local/backups/okular-"$slackver"
    fi
    if [ /home/philbev/.kde/share/apps/okular/bookmarks.xml -nt /usr/local/backups/okular-"${slackver}"/bookmarks.xml ]; then
	echo "Backing up Okular bookmarks....."
	cp -v /home/philbev/.kde/share/apps/okular/bookmarks.xml /usr/local/backups/okular-"${slackver}"/bookmarks.xml
    fi
fi

# The "root" user needs its initialization files updated regularly to keep in sync with user "philbev".
# This should only be run as superuser, hence the "if" statement. While we are at it, we'll update
# the /etc/skel directory as well.
#if [ $USER = root ]; then
	#/usr/local/sbin/syncusers
#fi


dh () {
    du "$@" -d 1 -xh | sort -rh
}

rsync-slack64 () {
    repo=/usr/local/downloads/repositories/slackware64
    wget -q -P /tmp http://ftp.slackware.uk/slackware/slackware64-current/ChangeLog.txt
    if diff /tmp/ChangeLog.txt $repo/latest/ChangeLog.txt >/dev/null; then
        rm -v /tmp/ChangeLog.txt
        echo -e "\033[1;35m"NO CHANGES! Nothing to download"\033[0m"
    else
        rm -v /tmp/ChangeLog.txt
	    rsync -avh --delete --progress /$repo/latest/ $repo/previous
	    rsync -avh --delete --progress --exclude=source rsync://rsync.slackware.uk/slackware/slackware64-current/ $repo/latest
    fi
}

rsync-italian () {
    rsync -avh --progress --delete  /usr/local/docs/italian/ /home/philbev/Dropbox/italian
}

rsync-german () {
    rsync -avh --progress --delete /usr/local/docs/german/ /home/philbev/Dropbox/german
}

g () {
	g++ -o "${1%.cpp}" "$@"
}

gh () {
    if [[ $# != 1 ]]; then
        echo "grep for <search-item> in history:-"
        echo "Usage: gh <search-item>"
    fi
    history | grep "$@" 2>/dev/null
}


l () {
    ls -lF --color --group-directories-first "$@" | less
}

la () {
    ls -alF --color=auto  --group-directories-first  "$@" | less
}

ll () {

	ls -AlF --color=auto  --group-directories-first "$@" | less 
}

lm () {

	ls -AlF --color=auto  --group-directories-first "$@" | more
}

inf () {
	info coreutils "$@" "invocation"
}

mydate () {
    date
}

# MY /home/.bashrc INITIALISATION FILE

###################################################################################################
#	    SOURCED FILES									  #
###################################################################################################

# Load all my functions from $HOME/.functions.sh
if [[ -f $HOME/.functions.sh ]]; then
    . $HOME/.functions.sh
fi

if [[ -f ~/.git-completion.bash ]]; then
    source .git-completion.bash
fi



###################################################################################################
#			ENVIRONMENT VARIABLES							  #
###################################################################################################

if [[ $USER != root ]]; then
    export LS_OPTIONS=${LS_OPTIONS/auto/always}
fi
export PATH=$PATH:/usr/local/bin/android-studio/bin:/usr/local/bin/android-sdk-linux/platform-tools	# Needed for Android SDK
export CDPATH=.:/usr/local:/usr/local/downloads:/usr/local/docs
export LANG="en_GB.UTF-8"
ps_local='\[\033[1;34m\][\u:\w]\$ \[\033[0m\]'
ps_ssh="\033[1;35m(\h) $ps_local"
who -m | grep -q '([^:]\+)' && PS1="$ps_ssh" || PS1="$ps_local"
export PS1
export LESS="-eFRX"
export HISTCONTROL=ignoredups:ignorespace:erasedups
export HISTTIMEFORMAT="%c: "
export QUEUEDIR=/home/philbev/.sbopkg/queues	# Needed for Sbopkg
export HISTFILESIZE=10000
export HISTSIZE=1000
export HISTIGNORE=l:ll:lm:c:a:h:la:lh
export PROMPT_COMMAND="history -a"
export REPOS=/usr/local/downloads/repositories
export GREP_COLORS="ms=01;34:fn=01;32"
export GVFS_DISABLE_FUSE=1
export CXXFLAGS='-std=c++14 -g -Wall'
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export SLACK_DIR=/usr/local/downloads/repositories/slackware64/latest
shopt -s histappend



###################################################################################################
#				ALIASES								  #
###################################################################################################
alias ..="cd .."
alias a=alias
alias c=clear
alias cat=less
alias dot='. $HOME/.bash_profile'
alias dot='. $HOME/.bashrc'
alias ej0='eject -T /dev/sr0'
alias ej1='eject -T /dev/sr1'
alias ej='eject -T /dev/sr0'
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
alias startx='startx -- -nolisten tcp'
alias v=nvim
alias vib='vi $HOME/.bashrc'
alias vil='vi $HOME/.bash_logout'
alias vip='vi $HOME/.bash_profile'
alias viv='vi $HOME/.vimrc'



###################################################################################################
#				FUNCTIONS							  #
###################################################################################################
# This will run before any command is executed.
function PreCommand() {
  if [ -z "$AT_PROMPT" ]; then
    return
  fi
  unset AT_PROMPT

  # Do stuff.
  #echo "Running PreCommand"	# PUT COMMAND HERE
  is_git_dir			# is_git_dir() function in ~/.functions.
}
trap "PreCommand" DEBUG

# This will run after the execution of the previous full command line.  We don't
# want it PostCommand to execute when first starting a bash session (i.e., at
# the first prompt).
FIRST_PROMPT=1
function PostCommand() {
  AT_PROMPT=1

  if [ -n "$FIRST_PROMPT" ]; then
    unset FIRST_PROMPT
    return
  fi

  # Do stuff.
  #echo "Running PostCommand"
}
PROMPT_COMMAND="PostCommand"




# Let's back-up okular bookmark file to directory where it will not be deleted when KDE
# is upgraded.
slackver=`cat /etc/slackware-version | sed 's/Slackware //'`
if [ ! -d /usr/local/backups/okular-$slackver ]; then
	mkdir -vp /usr/local/backups/okular-$slackver
fi
if [ /home/philbev/.kde/share/apps/okular/bookmarks.xml -nt /usr/local/backups/okular-${slackver}/bookmarks.xml ]; then
	echo "Backing up Okular bookmarks....."
	cp -v /home/philbev/.kde/share/apps/okular/bookmarks.xml /usr/local/backups/okular-${slackver}/bookmarks.xml
fi

# The "root" user needs its initialization files updated regularly to keep in sync with user "philbev".
# This should only be run as superuser, hence the "if" statement. While we are at it, we'll update
# the /etc/skel directory as well.
#if [ $USER = root ]; then
	#/usr/local/sbin/syncusers
#fi

# The following allows root user to launch GUI programmes from the command line. Thanks
# to AlienBob for this one :-)
#if [[ $USER == root ]]
#then
    #xauth merge ~philbev/.Xauthority
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

rsync-multilib () {
    rsync -avh --delete --progress ftp.slackware.uk::people/alien/multilib/current/ $REPOS/multilib/temp
    if diff -rq $REPOS/multilib/latest $REPOS/multilib/temp >/dev/null; then
        echo -e "\033[1;35m"No updates available"\033[0m"
    else
        rsync -avh --delete --progress $REPOS/multilib/latest/ $REPOS/multilib/previous
        rsync -avh --delete --progress $REPOS/multilib/temp/ $REPOS/multilib/latest
    fi
}

rsync-italian () {
    rsync -avh --progress --delete  /usr/local/docs/italian/ /home/philbev/Dropbox/italian
}

rsync-german () {
    rsync -avh --progress --delete /usr/local/docs/german/ /home/philbev/Dropbox/german
}

g () {
	g++ -o ${1%.cpp} "$@"
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
    ls -alF --color --group-directories-first  "$@" | less
}

ll () {

	ls -AlF --color --group-directories-first "$@" | less 
}

lm () {

	ls -AlF --color --group-directories-first "$@" | more
}

inf () {
	info coreutils "$@" "invocation"
}

mydate () {
    date
}

#!/bin/bash
# My bash functions go here. To be sourced by $HOME/.bashrc.

        #########################
        #     yorn              #
        #########################

# yorn: Displays a message provided by the user and expects a "y" or "n" in
# response. The response is located in $REPLY.

yorn() {
    usage (){
        echo "Usage: yorn message | -h"
        echo "There must be only 1 argument."
        echo "Either the message you wish to display or -h"
    }

    if [[ $# != 1 ]]
    then
        usage
        return 1
    elif [[ $1 == -h ]]
    then
        usage
        return 1
    fi
    
    unset REPLY

    while [[ $REPLY != y && $REPLY != n ]]
    do
        echo -n $1
        read -n 1 REPLY
        echo
    done

}


        ###########
        # etime   #
        ###########

# etime - a function to measure the time taken for a program to run. Needs
# start and end times as arguments.

etime (){
    usage () {
        echo "Usage: etime start_time end_time"
        echo "start_time and end_time in seconds."
        echo "For this help  etime [-h]"
    }

    #if [[ $# -gt 2 || $# -eq 0 || $1 == -h ]]
    if [[ $# -ne 2 ]]
    then
        usage
        return 1
    fi

    start=$1
    end=$2
    echo "Start time =  $start"
    echo "end time = $end"
    elapsed=$((end - start))
    days=00
    hrs=00
    mins=00
    secs=$((elapsed % 60))
    mins=$((elapsed / 60 % 60))
    hrs=$((elapsed / 3600))
    printf "Time elapsed = %02d:%02d:%02d\n" $hrs $mins $secs
}

##########
#  GITN  #
##########


gitn () {
    case $1 in
    	1)
	    git log --decorate --oneline --graph HEAD~1..HEAD
    		;;
    	2)
	    git log --decorate --oneline --graph HEAD~2..HEAD
    		;;
    	3)
	    git log --decorate --oneline --graph HEAD~3..HEAD
    		;;
    	4)
	    git log --decorate --oneline --graph HEAD~4..HEAD
    		;;
    	5)
	    git log --decorate --oneline --graph HEAD~5..HEAD
    		;;
    	6)
	    git log --decorate --oneline --graph HEAD~6..HEAD
    		;;
    	7)
	    git log --decorate --oneline --graph HEAD~7..HEAD
    		;;
    	8)
	    git log --decorate --oneline --graph HEAD~8..HEAD
    		;;
    	9)
	    git log --decorate --oneline --graph HEAD~9..HEAD
    		;;
    	10)
	    git log --decorate --oneline --graph HEAD~10..HEAD
    		;;
    	15)
	    git log --decorate --oneline --graph HEAD~15..HEAD
    		;;
    	*)
	    git log --decorate --oneline --graph HEAD~20..HEAD
    		;;
    esac
}

# While we're at it let's generate a (very simple) completion.
complete -W "1 2 3 4 5 6 7 8 9 10 15" gitn


###########################################################################################
#    is_git_dir() function returns the git branch only if there have been modifications.  #
##########################################################################################

is_git_dir () {
if [[ -d .git ]]; then
    MODIFIED=false
    STAGED=false
    BRANCH=$(git branch | sed -n '/^\*/s/^\* //p')
    if git status | grep -Eq 'Changes not staged for commit:|Untracked files:'; then
	MODIFIED=true
    fi
    if git status | grep -q 'Changes to be committed'; then
	STAGED=true
    fi
    if [[ $MODIFIED == "true" && $STAGED == "false" ]]; then
	echo "($BRANCH)"
    fi
    if [[ $MODIFIED == "false" && $STAGED == "true" ]]; then
	echo "($BRANCH)"
    fi
    if [[ $MODIFIED == "true" && $STAGED == "true" ]]; then
	echo "($BRANCH)"
    fi
    if [[ $MODIFIED == "false" && $STAGED == "false" ]]; then
	:   #Do nothing
    fi
fi

}

#####################################################
#  c() A FUNCTION TO CHANGE TO POPULAR DIRECTORIES  #
#####################################################

cusage () {
    echo "Usage: c a|d|p|r|v"
    return 1
}

c () {
if [[ $1 != 'a' && $1 != 'd' && $1 != 'p' && $1 != 'r' && $1 != v ]]; then
    cusage
fi

    case $1 in
	a )
	    cd /usr/local/audio/mp3 ;;
	d )
	    cd /usr/local/docs ;;
	p )
	    cd /usr/local/pictures ;;
	r )
	    cd /usr/local/downloads/repositories/;;
	v )
	    cd /usr/local/videos ;;

	esac
}


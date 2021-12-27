#!/usr/bin/bash
# File: ~/gitfiles/bash_logout	    Maintainer: Phil Bevan <phil@philbev.co.uk>
# Linked to ~/.bash_logout.


if [[ $KONSOLE_PROFILE_NAME = "Light" ]]; then
    if [ -f ~/.lightbg ]; then
	rm ~/.lightbg
    fi
fi

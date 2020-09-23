if [ -e $HOME/.bashrc ]; then
	. $HOME/.bashrc
fi
fortune /usr/share/fortune | cowsay

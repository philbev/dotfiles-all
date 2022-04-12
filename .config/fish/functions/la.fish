function la --description 'alias la=ls -AlF | less'
	exa -alghF --color=always --icons --git --group-directories-first $argv | less
end

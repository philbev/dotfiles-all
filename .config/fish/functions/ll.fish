
function ll --description 'ls -AlF --color=always $argv | less'
	exa -lghF --color=always --icons --git --group-directories-first $argv | less
end

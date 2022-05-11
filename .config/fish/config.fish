if status is-interactive
    # Commands to run in interactive sessions can go here
	alias l='exa -lhgF  --git --icons --group-directories-first'
	alias lk='lsblk -o model,type,name,fstype,size,label,mountpoint,partlabel'
	alias dot='source ~/.config/fish/config.fish'
	alias gitx='~/.zfuncs/gitx'
	alias pi='sudo pacman -S '
	alias pu='sudo pacman -Syyu '
	alias update='sudo pacman -Syyu'
	alias vi3='nvim ~/.config/i3/config'
	alias vif='nvim ~/.config/fish/config.fish'
	alias vin='cd ~/.config/nvim/lua/setup; nvim ~/.config/nvim/init.lua packer.lua mappings.lua lspconfig.lua settings.lua whichkey.lua'
	alias rv='rm -v'
	# Starship prompt
	starship init fish | source
end

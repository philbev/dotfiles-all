# Setup fzf
# ---------
if [[ ! "$PATH" == */home/phil/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/phil/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/phil/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/phil/.fzf/shell/key-bindings.zsh"

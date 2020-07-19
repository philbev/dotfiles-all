# Files (runs $FZF_DEFAULT_COMMAND if defined)
:Files [PATH]

# Git files (git ls-files)
:GFiles [OPTS]

# Git files (git status)
:GFiles?

# Open buffers
:Buffers

# Color schemes
:Colors

# ag search result (ALT-A to select all, ALT-D to deselect all)
:Ag [PATTERN]

# rg search result (ALT-A to select all, ALT-D to deselect all)
:Rg [PATTERN]

# Lines in loaded buffers
:Lines [QUERY]

# Lines in the current buffer
:BLines [QUERY]

# Tags in the project (ctags -R)
:Tags [QUERY]

# Tags in the current buffer
:BTags [QUERY]

# Marks
:Marks

# Windows
:Windows

# PATTERN locate command output
:Locate

# v:oldfiles and open buffers
:History

# Command history
:History:

# Search history
:History/

# Snippets (UltiSnips)
:Snippets

# Git commits (requires fugitive.vim)
:Commits

# Git commits for the current buffer
:BCommits

# Commands
:Commands

# Normal mode mappings
:Maps

# Help tags 1
:Helptags

# File types
:Filetypes

Most commands support CTRL-T / CTRL-X / CTRL-V key bindings to open in a new tab, a new split, or in a new vertical split
Bang-versions of the commands (e.g. Ag!) will open fzf in fullscreen
You can set g:fzf_command_prefix to give the same prefix to the commands
e.g. let g:fzf_command_prefix = 'Fzf' and you have FzfFiles, etc.

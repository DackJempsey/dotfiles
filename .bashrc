# ~/.bashrc: executed by bash(1) for non-login shells.

# Enable history search with arrow keys
# This allows reverse lookup when pressing up arrow
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# History settings
export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTCONTROL=ignoredups:erasedups

# Append to history file, don't overwrite
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist

# Customize your bash prompt (optional)
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# ~/.zshrc: executed by zsh(1) for interactive shells.

# Enable history search with arrow keys
# This allows reverse lookup when pressing up arrow
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

# Also bind for vi mode if enabled
bindkey -M vicmd 'k' history-beginning-search-backward
bindkey -M vicmd 'j' history-beginning-search-forward

# History settings
export HISTSIZE=10000
export SAVEHIST=20000
export HISTFILE=~/.zsh_history

# Remove duplicates from history
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS

# Append to history file, don't overwrite
setopt APPEND_HISTORY

# Share history between all sessions
setopt SHARE_HISTORY

# Save timestamp and duration in history
setopt EXTENDED_HISTORY

# Customize your zsh prompt (optional)
# Using a simple colored prompt similar to bash
PROMPT='%F{green}%n@%m%f:%F{blue}%~%f%# '

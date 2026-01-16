# ~/.zprofile: executed by zsh(1) for login shells.

# Set vim as the default editor
export EDITOR=vim
export VISUAL=vim

# Source .zshrc if it exists
if [ -f ~/.zshrc ]; then
    . ~/.zshrc
fi

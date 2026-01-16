# dotfiles
A personal configuration repository for quickly setting up new development environments.

## Features

### Shell Configuration (`.bashrc` and `.bash_profile`)
- **Reverse history search with arrow keys**: Press up/down arrows to search through your command history based on what you've typed
- **Enhanced history settings**: Large history size with duplicate removal
- **Vim as default editor**: Sets vim as the default editor for all applications

### Vim Configuration (`.vimrc`)
- **Line numbers**: Displays line numbers in vim
- **Syntax highlighting**: Enabled by default
- **Smart indentation**: Auto and smart indent enabled
- **Search improvements**: Incremental search with highlighting

## Installation

To use these configurations on a new machine:

### Quick Install (Symbolic Links)
```bash
# Clone the repository
git clone https://github.com/DackJempsey/dotfiles.git ~/dotfiles

# Create symbolic links
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/dotfiles/.vimrc ~/.vimrc

# Reload your shell configuration
source ~/.bash_profile
```

### Manual Install (Copy Files)
```bash
# Clone the repository
git clone https://github.com/DackJempsey/dotfiles.git ~/dotfiles

# Copy configuration files
cp ~/dotfiles/.bashrc ~/.bashrc
cp ~/dotfiles/.bash_profile ~/.bash_profile
cp ~/dotfiles/.vimrc ~/.vimrc

# Reload your shell configuration
source ~/.bash_profile
```

## Usage

### Shell History Search
After installation, you can:
1. Start typing a command (e.g., `git`)
2. Press the up arrow key to cycle through previous commands that start with `git`
3. Press the down arrow key to go forward in the search

### Vim
- Open any file with `vim filename`
- Line numbers will be displayed automatically
- Use `:set number!` to toggle line numbers on/off

## Customization

Feel free to modify these configuration files to suit your preferences:
- **`.bashrc`**: Customize your shell prompt, aliases, and history settings
- **`.vimrc`**: Add more vim plugins or change key mappings
- **`.bash_profile`**: Set additional environment variables

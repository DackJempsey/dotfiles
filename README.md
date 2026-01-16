# dotfiles
A personal configuration repository for quickly setting up new development environments.

## Features

### Shell Configuration
#### Bash (`.bashrc` and `.bash_profile`)
- **Reverse history search with arrow keys**: Press up/down arrows to search through your command history based on what you've typed
- **Enhanced history settings**: Large history size with duplicate removal
- **Vim as default editor**: Sets vim as the default editor for all applications

#### Zsh (`.zshrc` and `.zprofile`)
- **Reverse history search with arrow keys**: Press up/down arrows to search through your command history based on what you've typed
- **Enhanced history settings**: Large history size with duplicate removal, history sharing between sessions
- **Vim as default editor**: Sets vim as the default editor for all applications

### Vim Configuration (`.vimrc`)
- **Line numbers**: Displays line numbers in vim
- **Syntax highlighting**: Enabled by default
- **Smart indentation**: Auto and smart indent enabled
- **Search improvements**: Incremental search with highlighting

## Installation

To use these configurations on a new machine:

### One-Line Install (Recommended)

The easiest way to install these dotfiles is using the installation script, which downloads files directly from GitHub without requiring git clone:

```bash
curl -fsSL https://raw.githubusercontent.com/DackJempsey/dotfiles/main/install.sh | bash
```

This script will:
- Automatically detect your shell (Bash or Zsh)
- Download the appropriate configuration files
- Back up any existing configuration files
- Install the new configurations to your home directory

### Quick Install (Symbolic Links)

#### For Bash users:
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

#### For Zsh users:
```bash
# Clone the repository
git clone https://github.com/DackJempsey/dotfiles.git ~/dotfiles

# Create symbolic links
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zprofile ~/.zprofile
ln -sf ~/dotfiles/.vimrc ~/.vimrc

# Reload your shell configuration
source ~/.zprofile
```

### Manual Install (Copy Files)

#### For Bash users:
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

#### For Zsh users:
```bash
# Clone the repository
git clone https://github.com/DackJempsey/dotfiles.git ~/dotfiles

# Copy configuration files
cp ~/dotfiles/.zshrc ~/.zshrc
cp ~/dotfiles/.zprofile ~/.zprofile
cp ~/dotfiles/.vimrc ~/.vimrc

# Reload your shell configuration
source ~/.zprofile
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
- **`.bashrc` / `.zshrc`**: Customize your shell prompt, aliases, and history settings
- **`.vimrc`**: Add more vim plugins or change key mappings
- **`.bash_profile` / `.zprofile`**: Set additional environment variables

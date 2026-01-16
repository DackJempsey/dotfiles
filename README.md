# dotfiles
A personal configuration repository for quickly setting up new development environments.

## Features

### Shell Configuration (`.bashrc`)
- **Reverse history search**: Use arrow-up and arrow-down to search through command history incrementally
  - Start typing a command and press arrow-up to find previous commands that match
- **Vim as default editor**: Sets `vim` as the default editor for git commits and other tools
- Colorized `ls` and `grep` output
- Useful aliases for common commands
- Enhanced history management

### Vim Configuration (`.vimrc`)
- **Line numbers**: Displays line numbers for easy navigation
- Syntax highlighting enabled
- Smart indenting with 4-space tabs
- Incremental search with highlighting
- Mouse support in all modes
- Enhanced cursor visibility and navigation

## Installation

### Quick Setup

1. Clone this repository:
```bash
git clone https://github.com/DackJempsey/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

2. Run the installation script:
```bash
./install.sh
```

3. Apply the bash configuration:
```bash
source ~/.bashrc
```

### Manual Setup

If you prefer to set up manually, create symbolic links:

```bash
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.vimrc ~/.vimrc
source ~/.bashrc
```

## Usage

### Reverse History Search
1. Type the beginning of a command (e.g., `git`)
2. Press arrow-up to cycle through previous commands starting with `git`
3. Press arrow-down to cycle forward through the history

### Vim
- Line numbers are displayed automatically when you open files
- Vim is now your default editor for git commits and other tools

## Customization

Feel free to modify the configuration files to suit your preferences:
- Edit `.bashrc` for shell customizations
- Edit `.vimrc` for Vim customizations

## Backup

The installation script automatically backs up any existing configuration files to `~/.dotfiles_backup_<timestamp>` before creating symbolic links.

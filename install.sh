#!/usr/bin/env bash
#
# Dotfiles Installation Script
# Usage: curl -fsSL https://raw.githubusercontent.com/DackJempsey/dotfiles/main/install.sh | bash
#
# This script downloads and installs dotfiles directly from GitHub without requiring git clone.

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# GitHub repository details
GITHUB_USER="DackJempsey"
GITHUB_REPO="dotfiles"
GITHUB_BRANCH="main"
RAW_BASE_URL="https://raw.githubusercontent.com/${GITHUB_USER}/${GITHUB_REPO}/${GITHUB_BRANCH}"

# Function to print colored messages
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to download a file
download_file() {
    local filename=$1
    local target_path=$2
    local url="${RAW_BASE_URL}/${filename}"
    
    print_info "Downloading ${filename}..."
    
    if command -v curl &> /dev/null; then
        if curl -fsSL "${url}" -o "${target_path}"; then
            print_success "Downloaded ${filename}"
            return 0
        else
            print_error "Failed to download ${filename} from ${url}"
            print_error "Please check your internet connection and verify the URL is accessible."
            return 1
        fi
    elif command -v wget &> /dev/null; then
        if wget -q "${url}" -O "${target_path}"; then
            print_success "Downloaded ${filename}"
            return 0
        else
            print_error "Failed to download ${filename} from ${url}"
            print_error "Please check your internet connection and verify the URL is accessible."
            return 1
        fi
    else
        print_error "Neither curl nor wget is available. Please install one of them."
        exit 1
    fi
}

# Function to backup existing file
backup_file() {
    local filepath=$1
    if [ -f "${filepath}" ]; then
        local backup_path="${filepath}.backup.$(date +%Y%m%d_%H%M%S)"
        print_warning "Backing up existing ${filepath} to ${backup_path}"
        cp "${filepath}" "${backup_path}"
    fi
}

# Detect current shell
detect_shell() {
    if [ -n "$ZSH_VERSION" ]; then
        echo "zsh"
    elif [ -n "$BASH_VERSION" ]; then
        echo "bash"
    else
        # Try to detect from SHELL environment variable
        case "$SHELL" in
            */zsh)
                echo "zsh"
                ;;
            */bash)
                echo "bash"
                ;;
            *)
                echo "unknown"
                ;;
        esac
    fi
}

# Main installation function
main() {
    echo ""
    echo "========================================"
    echo "  Dotfiles Installation Script"
    echo "========================================"
    echo ""
    
    # Detect shell
    DETECTED_SHELL=$(detect_shell)
    
    if [ "$DETECTED_SHELL" = "unknown" ]; then
        print_warning "Could not detect your shell automatically."
        
        # Check if stdin is available for interactive input
        if [ ! -t 0 ]; then
            print_warning "No interactive terminal detected. Defaulting to Bash configuration."
            INSTALL_SHELL="bash"
        else
            echo ""
            echo "Which shell would you like to configure?"
            echo "1) Bash"
            echo "2) Zsh"
            echo "3) Both"
            read -t 60 -p "Enter your choice (1-3): " shell_choice
            
            # Handle timeout or empty input
            if [ -z "$shell_choice" ]; then
                print_warning "No input received. Defaulting to Bash configuration."
                INSTALL_SHELL="bash"
            else
                case $shell_choice in
                    1)
                        INSTALL_SHELL="bash"
                        ;;
                    2)
                        INSTALL_SHELL="zsh"
                        ;;
                    3)
                        INSTALL_SHELL="both"
                        ;;
                    *)
                        print_error "Invalid choice. Exiting."
                        exit 1
                        ;;
                esac
            fi
        fi
    else
        print_info "Detected shell: ${DETECTED_SHELL}"
        INSTALL_SHELL=$DETECTED_SHELL
    fi
    
    echo ""
    print_info "This script will install dotfiles to your home directory."
    print_info "Any existing files will be backed up."
    echo ""
    
    # Create temporary directory for downloads
    TEMP_DIR=$(mktemp -d)
    trap "rm -rf ${TEMP_DIR}" EXIT
    
    print_info "Using temporary directory: ${TEMP_DIR}"
    echo ""
    
    # Download and install based on shell choice
    if [ "$INSTALL_SHELL" = "bash" ] || [ "$INSTALL_SHELL" = "both" ]; then
        print_info "Installing Bash configuration..."
        
        # Download bash files
        if ! download_file ".bashrc" "${TEMP_DIR}/.bashrc"; then
            exit 1
        fi
        if ! download_file ".bash_profile" "${TEMP_DIR}/.bash_profile"; then
            exit 1
        fi
        
        # Backup and install
        backup_file "${HOME}/.bashrc"
        backup_file "${HOME}/.bash_profile"
        
        cp "${TEMP_DIR}/.bashrc" "${HOME}/.bashrc"
        cp "${TEMP_DIR}/.bash_profile" "${HOME}/.bash_profile"
        
        print_success "Bash configuration installed!"
    fi
    
    if [ "$INSTALL_SHELL" = "zsh" ] || [ "$INSTALL_SHELL" = "both" ]; then
        print_info "Installing Zsh configuration..."
        
        # Download zsh files
        if ! download_file ".zshrc" "${TEMP_DIR}/.zshrc"; then
            exit 1
        fi
        if ! download_file ".zprofile" "${TEMP_DIR}/.zprofile"; then
            exit 1
        fi
        
        # Backup and install
        backup_file "${HOME}/.zshrc"
        backup_file "${HOME}/.zprofile"
        
        cp "${TEMP_DIR}/.zshrc" "${HOME}/.zshrc"
        cp "${TEMP_DIR}/.zprofile" "${HOME}/.zprofile"
        
        print_success "Zsh configuration installed!"
    fi
    
    # Download and install vim configuration
    print_info "Installing Vim configuration..."
    if ! download_file ".vimrc" "${TEMP_DIR}/.vimrc"; then
        exit 1
    fi
    backup_file "${HOME}/.vimrc"
    cp "${TEMP_DIR}/.vimrc" "${HOME}/.vimrc"
    print_success "Vim configuration installed!"
    
    echo ""
    echo "========================================"
    print_success "Installation complete!"
    echo "========================================"
    echo ""
    print_info "To apply the changes, run one of the following:"
    
    if [ "$INSTALL_SHELL" = "bash" ] || [ "$INSTALL_SHELL" = "both" ]; then
        echo "  For Bash: source ~/.bash_profile"
    fi
    
    if [ "$INSTALL_SHELL" = "zsh" ] || [ "$INSTALL_SHELL" = "both" ]; then
        echo "  For Zsh:  source ~/.zprofile"
    fi
    
    echo ""
    print_info "Or simply restart your shell."
    echo ""
}

# Run main function
main

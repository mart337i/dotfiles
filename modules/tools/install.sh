#!/bin/bash
set -e

echo "Installing CLI tools..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log_info() { echo -e "${GREEN}[INFO]${NC} $1"; }
log_warning() { echo -e "${YELLOW}[WARNING]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

# Check if running as root (for sudo commands)
check_sudo() {
    if ! sudo -n true 2>/dev/null; then
        log_warning "Some tools require sudo access. You may be prompted for your password."
    fi
}

# Install fzf
install_fzf() {
    if ! command -v fzf >/dev/null 2>&1; then
        log_info "Installing fzf..."
        if [ -d ~/.fzf ]; then
            rm -rf ~/.fzf
        fi
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        ~/.fzf/install --all --no-update-rc
        log_info "fzf installed successfully"
    else
        log_info "fzf already installed"
    fi
}

# Install goto (with error handling)
install_goto() {
    if ! command -v goto >/dev/null 2>&1; then
        log_info "Installing goto..."
        if command -v sudo >/dev/null 2>&1; then
            rm -rf /tmp/goto
            git clone https://github.com/iridakos/goto.git /tmp/goto
            cd /tmp/goto
            if sudo ./install; then
                log_info "goto installed successfully"
            else
                log_warning "goto installation failed"
            fi
            cd - >/dev/null
            rm -rf /tmp/goto
        else
            log_warning "sudo not available, skipping goto installation"
        fi
    else
        log_info "goto already installed"
    fi
}

# Install bottom (with architecture detection)
install_bottom() {
    if ! command -v btm >/dev/null 2>&1; then
        log_info "Installing bottom..."
        
        # Detect architecture
        ARCH=$(uname -m)
        case $ARCH in
            x86_64)
                BOTTOM_ARCH="x86_64"
                ;;
            aarch64|arm64)
                BOTTOM_ARCH="aarch64"
                ;;
            *)
                log_warning "Unsupported architecture: $ARCH, trying x86_64"
                BOTTOM_ARCH="x86_64"
                ;;
        esac
        
        # Try different installation methods
        if command -v cargo >/dev/null 2>&1; then
            log_info "Installing bottom via cargo..."
            cargo install bottom
        elif command -v apt >/dev/null 2>&1 && command -v sudo >/dev/null 2>&1; then
            log_info "Installing bottom via apt..."
            BOTTOM_VERSION="0.10.2"
            BOTTOM_DEB="bottom_${BOTTOM_VERSION}-1_amd64.deb"
            curl -LO "https://github.com/ClementTsang/bottom/releases/download/${BOTTOM_VERSION}/${BOTTOM_DEB}" || {
                log_warning "Failed to download bottom package"
                return 1
            }
            if sudo dpkg -i "$BOTTOM_DEB"; then
                log_info "bottom installed successfully"
            else
                log_warning "bottom installation failed"
            fi
            rm -f "$BOTTOM_DEB"
        else
            log_warning "No suitable package manager found for bottom installation"
        fi
    else
        log_info "bottom already installed"
    fi
}

# Install starship
install_starship() {
    if ! command -v starship >/dev/null 2>&1; then
        log_info "Installing starship..."
        if curl -sS https://starship.rs/install.sh | sh -s -- --yes; then
            log_info "starship installed successfully"
        else
            log_warning "starship installation failed"
        fi
    else
        log_info "starship already installed"
    fi
}

# Main installation
main() {
    check_sudo
    
    install_fzf
    install_goto
    install_bottom
    install_starship
    
    echo ""
    log_info "CLI tools installation completed!"
    log_info "Please restart your shell to use the new tools"
}

main "$@"
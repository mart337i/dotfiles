#!/bin/bash
set -e

echo "Installing CLI tools..."

# Install fzf
if ! command -v fzf >/dev/null 2>&1; then
    echo "Installing fzf..."
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --all
else
    echo "fzf already installed"
fi

# Install goto
if ! command -v goto >/dev/null 2>&1; then
    echo "Installing goto..."
    git clone https://github.com/iridakos/goto.git /tmp/goto
    cd /tmp/goto
    sudo ./install
    cd -
    rm -rf /tmp/goto
else
    echo "goto already installed"
fi

# Install bottom
if ! command -v btm >/dev/null 2>&1; then
    echo "Installing bottom..."
    curl -LO https://github.com/ClementTsang/bottom/releases/download/0.10.2/bottom_0.10.2-1_amd64.deb
    sudo dpkg -i bottom_0.10.2-1_amd64.deb
    rm bottom_0.10.2-1_amd64.deb
else
    echo "bottom already installed"
fi

# Install starship
if ! command -v starship >/dev/null 2>&1; then
    echo "Installing starship..."
    curl -sS https://starship.rs/install.sh | sh
else
    echo "starship already installed"
fi

echo "CLI tools installation completed!"
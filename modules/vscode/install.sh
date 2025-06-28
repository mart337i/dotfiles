#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
EXTENSIONS_FILE="$SCRIPT_DIR/extensions.txt"

if [ ! -f "$EXTENSIONS_FILE" ]; then
    echo "Extensions file not found: $EXTENSIONS_FILE"
    exit 1
fi

if ! command -v code >/dev/null 2>&1; then
    echo "VS Code not found. Please install VS Code first."
    exit 1
fi

echo "Installing VS Code extensions..."
cat "$EXTENSIONS_FILE" | xargs -n 1 code --install-extension

echo "VS Code extensions installation completed!"
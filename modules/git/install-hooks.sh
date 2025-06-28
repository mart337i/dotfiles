#!/bin/bash

mkdir -p ~/.git-hooks

# Configure Git to use this directory globally
git config --global core.hooksPath ~/.git-hooks

# Create the commit-msg hook
cat > ~/.git-hooks/commit-msg << 'EOF'
#!/bin/bash

# Allowed tags
TAGS="FIX|REF|ADD|REM|REV|MOV|REL|IMP|MERGE|CLA|I18N|PERF"

# Read the commit message
COMMIT_MSG=$(cat "$1")

# Check if the commit message contains at least one valid tag
if ! echo "$COMMIT_MSG" | grep -qE "\\[($TAGS)\\]"; then
    echo "Error: Commit message must contain one of the following tags:"
    echo "[FIX], [REF], [ADD], [REM], [REV], [MOV], [REL], [IMP], [MERGE], [CLA], [I18N], [PERF]"
    exit 1
fi
EOF

# Make the hook executable
chmod +x ~/.git-hooks/commit-msg

echo "Git hooks installed successfully!"
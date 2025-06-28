# Dotfiles

A modular and configurable collection of dotfiles for a customized development environment.

## Quick Install

```bash
curl -fsSL https://raw.githubusercontent.com/mart337i/dotfiles/main/install | bash
```

Or clone and install:

```bash
git clone https://github.com/mart337i/dotfiles.git ~/.dotfiles && ~/.dotfiles/install
```

## Features

- **Modular Design**: Enable/disable components as needed
- **Configurable**: YAML-based configuration system
- **Backup System**: Automatic backup of existing configurations
- **Smart Installation**: Only installs what you need

## Modules

- **Shell**: Bash configuration, aliases, and prompt customization
- **Git**: Git configuration and commit message hooks
- **Tools**: CLI tools (fzf, starship, bottom, goto)
- **VS Code**: Extension management
- **Python**: Python-specific configurations
- **Docker**: Docker aliases and utilities

## Configuration

Edit the configuration file to customize your installation:

```bash
~/.dotfiles/install --config
```

Or manually edit `~/.dotfiles/config.yaml`:

```yaml
modules:
  shell: true
  git: true
  tools: true
  vscode: false  # Disable VS Code module
  python: true
  docker: true

settings:
  git:
    name: "Your Name"
    email: "your.email@example.com"
    editor: "nano"
    enforce_commit_tags: true
```

## Usage

- **Install**: `~/.dotfiles/install`
- **Configure**: `~/.dotfiles/install --config`
- **Help**: `~/.dotfiles/install --help`

## Module Structure

```
modules/
├── shell/          # Bash configuration
├── git/            # Git setup and hooks
├── tools/          # CLI tools installation
├── vscode/         # VS Code extensions
├── python/         # Python configurations
└── docker/         # Docker utilities
```

## Adding New Modules

1. Create a new directory in `modules/`
2. Add an `install.sh` script
3. Update `config.yaml` to include the new module
4. Update the main `install` script to handle the new module

## Backup

Your existing configurations are automatically backed up to `~/.dotfiles-backup-TIMESTAMP/` before installation.
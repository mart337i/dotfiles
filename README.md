# Dotfiles

A modular and configurable collection of dotfiles for a customized development environment.

## Installation

### Quick Install

Clone the repository and run the installer:

```bash
git clone https://github.com/mart337i/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install
```

### What Gets Installed

The installer will:
- Create backups of existing configuration files
- Create symbolic links to dotfiles configurations
- Install CLI tools (if enabled)
- Configure shell, git, and other development tools

All existing configurations are automatically backed up to `~/.dotfiles-backup-TIMESTAMP/` before installation.

## Features

- **Modular Design**: Enable/disable components as needed
- **Configurable**: YAML-based configuration system
- **Backup System**: Automatic backup of existing configurations
- **Smart Installation**: Only installs what you need
- **Cross-platform**: Works on Linux and macOS

## Available Modules

| Module | Description | What it includes |
|--------|-------------|------------------|
| **Shell** | Bash configuration and aliases | Custom prompt, history settings, useful aliases |
| **Git** | Git configuration and aliases | User settings, colors, helpful aliases |
| **Tools** | CLI productivity tools | fzf, starship, bottom, goto |
| **VS Code** | VS Code extensions | Automatically installs configured extensions |
| **Python** | Python development setup | Python-specific configurations |
| **Docker** | Docker utilities | Docker aliases and shortcuts |

## Configuration

### Quick Configuration

Edit the configuration file:

```bash
cd ~/.dotfiles
./install --config
```

### Manual Configuration

Edit `~/.dotfiles/config.yaml` to customize your installation:

```yaml
modules:
  shell: true          # Bash configuration, aliases, prompt
  git: true           # Git configuration and hooks
  tools: true         # CLI tools (fzf, starship, bottom, goto)
  vscode: true        # VS Code extensions
  python: true        # Python-specific configurations
  docker: true        # Docker aliases and configurations

settings:
  git:
    name: "Your Name"
    email: "your.email@example.com"
    editor: "nano"
    enforce_commit_tags: true
  
  shell:
    enable_starship: true
    enable_fzf: true
    history_size: 2000
    
  tools:
    install_bottom: true
    install_goto: true
    
  vscode:
    auto_install_extensions: true
```

### Module Settings

- **shell**: Controls bash configuration and prompt
- **git**: Sets up git user info and preferences
- **tools**: Installs CLI productivity tools
- **vscode**: Manages VS Code extension installation
- **python**: Python development environment setup
- **docker**: Docker aliases and utilities

## Usage

### Commands

```bash
cd ~/.dotfiles

# Install dotfiles
./install

# Edit configuration
./install --config

# Show help
./install --help
```

### After Installation

1. **Restart your shell** or run:
   ```bash
   source ~/.bashrc
   ```

2. **Verify installation**:
   ```bash
   # Run the verification script
   ./verify
   
   # Or check manually
   fzf --version
   starship --version
   git config --list
   ```

### Updating

To update your dotfiles:

```bash
cd ~/.dotfiles
git pull
./install
```

## What Gets Configured

### Shell (Bash)
- Custom prompt with git branch display
- Extensive aliases for navigation and file operations
- History configuration and management
- Color-coded output
- Integration with fzf and starship (if installed)

### Git
- User configuration (name, email, editor)
- Helpful aliases (st, co, br, lg, etc.)
- Color-coded output
- Better log formatting
- Sensible defaults for push/pull behavior

### CLI Tools
- **fzf**: Fuzzy finder for files and command history
- **starship**: Cross-shell prompt with git integration
- **bottom**: Modern system monitor
- **goto**: Directory bookmarking tool

### VS Code
- Automatic installation of configured extensions
- Extensions include: Python, Docker, Git Graph, and more

## Troubleshooting

### Common Issues

1. **Permission denied**: Make sure the install script is executable:
   ```bash
   chmod +x ~/.dotfiles/install
   ```

2. **Tools not installing**: Some tools require sudo access. Make sure you can run sudo commands.

3. **VS Code extensions not installing**: Ensure VS Code is installed and the `code` command is available in your PATH.

4. **Configuration not taking effect**: Restart your shell or run `source ~/.bashrc`.

### Getting Help

- Check the install script help: `./install --help`
- View current configuration: `cat ~/.dotfiles/config.yaml`
- Check backup location: `ls ~/.dotfiles-backup-*`

## Backup and Recovery

- All existing configurations are backed up before installation
- Backups are stored in `~/.dotfiles-backup-TIMESTAMP/`
- To restore a backup, copy files from the backup directory back to your home directory

### Resetting to System Defaults

If you want to remove dotfiles and restore system defaults:

```bash
# Remove dotfiles symlinks
rm ~/.bashrc ~/.gitconfig ~/.bash_aliases

# Restore system defaults from /etc/skel
cp /etc/skel/.* ~/

# Or restore from backup
cp ~/.dotfiles-backup-TIMESTAMP/* ~/
```

## Customization

Feel free to modify the configuration files in the `modules/` directory to suit your preferences. The dotfiles are designed to be easily customizable and extensible.
# Dotfiles Management System

This dotfiles management system is designed to help you easily manage and maintain your dotfiles across multiple machines and environments. It provides a simple and organized way to keep track of your configurations, aliases, functions, and other shell settings. The system is compatible with bash, zsh, and ksh shells.

## Features

- Organized folder structure for easy management
- Support for machine-specific configurations
- Support for different operating systems and architectures
- Debugging support
- Automatically sources all scripts in the specified folders

## Installation

1. Fork this repository(set private) and clone to your home directory:

```bash
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
# or
git clone git@github.com/yourusername/dotfiles.git ~/.dotfiles
```

1. Run this script to create symbolic links to the necessary files:

```bash
# main
cp ~/.zshrc ~/.zshrc.bak
ln -sf ~/.dotfiles/zshrc ~/.zshrc

# optional
cp ~/.ssh/config ~/.ssh/config.bak
ln -sf ~/.dotfiles/ssh/config ~/.ssh/config

# optional
cp ~/.gitconfig ~/.gitconfig.bak
ln -sf ~/.dotfiles/git/gitconfig ~/.gitconfig
```

3. Restart your shell or run `source ~/.bashrc` (or `~/.zshrc`, `~/.kshrc` depending on your shell) to apply the changes.

## Usage

The dotfiles management system uses the following folder structure:

- `path`: Contains scripts to set up your PATH environment variable.
- `env`: Contains scripts to set up environment variables.
- `config`: Contains scripts for setting shell options and configurations.
- `function`: Contains scripts defining custom shell functions.
- `plugin`: Contains scripts for loading shell plugins.
- `alias`: Contains scripts defining custom aliases.
- `bind`: Contains scripts for setting key bindings.

To add a new script, simply create a new `.sh` file in the appropriate folder and it will be automatically sourced when you start a new shell session.

For machine-specific configurations, create a folder named `machine` in the base directory and add a subfolder named after your machine's name. Inside that subfolder, create `.sh` files with the same names as the folders listed above (e.g., `path.sh`, `env.sh`, etc.). These scripts will be sourced only on the specified machine.

## Customization

You can customize the dotfiles management system to fit your needs by modifying the provided scripts or adding new ones. If you need to add support for a new shell, update the `execute_shell()` function in the main script.

## Contributing

Contributions are welcome! If you have any improvements or suggestions, please feel free to open a pull request or create an issue.

## License

See [LICENSE](LICENSE) for more information.
# Neovim Configuration Setup

This guide will help you install and set up my Neovim configuration.

## 📥 Installation

### 1. Prerequisites
Ensure you have the following dependencies installed:

- **Neovim** (>= 0.9)
- **Git**
- **Python3 & pip**
- **Node.js & npm**
- **Ripgrep** (for Telescope fuzzy finding)

### 2. Clone the Configuration
Backup existing Neovim configuration (if any):
```sh
mv ~/.config/nvim ~/.config/nvim_backup
```

Clone this repository:
```sh
git clone https://github.com/saamodra/dotfiles.git
cd dotfiles
cp -r .config/nvim ~/.config/nvim
```

### 3. Install Plugins
Launch Neovim and run:
```sh
nvim
```
Then install plugins with:
```
:Lazy sync
```

### 4. Verify Installation
Ensure everything is working by checking:
- `:checkhealth` inside Neovim
- Plugins are installed correctly
- Keybindings and settings are applied

## 🎯 Features
- **Lazy.nvim** for plugin management
- **Telescope** for fuzzy finding
- **LSP & Treesitter** for code intelligence
- **Autocompletion & Snippets**
- **Git integration** via Fugitive
- **Github Copilot & Chat**
- **Test Runner**
- **Custom keybindings & themes**



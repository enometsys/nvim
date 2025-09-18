# Enometsys Neovim Configuration

**Personal fork of [NvChad](https://github.com/NvChad/NvChad) with custom configurations and enhancements.**

This repository contains my customized Neovim setup built on top of NvChad v2.5. It includes additional LSP configurations, plugins, and personal preferences for an enhanced development experience.

## ✨ Custom Features

In addition to NvChad's base features, this configuration includes:

- **TypeSpec LSP Support** - Full language server support for TypeSpec development
- **Enhanced Markdown Experience** - Live preview with `markdown-preview.nvim`
- **Improved TypeScript/JavaScript** - Enhanced highlighting and folding configurations
- **Custom Treesitter Folding** - Optimized code folding setup
- **Additional Plugins** - Carefully selected plugins for productivity
- **Personal Keymaps & Options** - Tailored to my workflow

## 📋 Prerequisites

- **Neovim 0.11+** (Required)
- **Git** 2.19.0+ (for partial clones)
- **[Nerd Font](https://www.nerdfonts.com/)** (Terminal font)
- **[Ripgrep](https://github.com/BurntSushi/ripgrep)** (For telescope grep)
- **Node.js** 16+ (For many LSP servers and plugins)
- **A C compiler** (gcc/clang for treesitter)

### Optional Dependencies

- **fd** - Better file finding
- **lazygit** - Git UI integration
- **Python 3** & **pip** - For Python LSP and tools

## 🚀 Installation

### Backup Existing Configuration

```bash
# Required: Backup your current nvim config
mv ~/.config/nvim ~/.config/nvim.bak

# Optional: Backup shared data
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

### Clone This Repository

```bash
git clone https://github.com/enometsys/nvim ~/.config/nvim
```

### Start Neovim

```bash
nvim
```

The first launch will:
1. Bootstrap lazy.nvim (plugin manager)
2. Install all configured plugins
3. Set up LSP servers and treesitter parsers

## 📦 Post-Installation

### Install LSP Servers

After the initial setup, install the language servers you need:

```vim
:MasonInstallAll
```

Or install specific servers:

```vim
:Mason
```

### Verify Setup

Check your installation:

```vim
:checkhealth
```

## 🗂️ Structure

```
~/.config/nvim/
├── init.lua                 # Entry point
├── lazy-lock.json          # Plugin version lock file
├── lua/
│   ├── chadrc.lua         # NvChad UI configuration
│   ├── options.lua        # Neovim options
│   ├── mappings.lua       # Keybindings
│   ├── autocmds.lua       # Auto commands
│   ├── configs/
│   │   ├── lazy.lua       # Lazy.nvim config
│   │   ├── lspconfig.lua  # LSP configurations
│   │   └── conform.lua    # Formatter config
│   └── plugins/
│       └── init.lua       # Plugin specifications
└── TYPESPEC_SETUP.md      # TypeSpec configuration guide
```

## 🔧 Customization

This configuration is designed to be easily customizable:

- **Add plugins**: Edit `lua/plugins/init.lua`
- **Configure LSP**: Modify `lua/configs/lspconfig.lua`
- **Change keymaps**: Update `lua/mappings.lua`
- **Adjust options**: Edit `lua/options.lua`
- **UI theme**: Customize in `lua/chadrc.lua`

## 📚 Documentation

- [NvChad Documentation](https://nvchad.com/)
- [TypeSpec Setup Guide](./TYPESPEC_SETUP.md)

## 🔄 Updates

To update this configuration:

```bash
# Pull latest changes
cd ~/.config/nvim
git pull

# Update plugins
nvim
:Lazy sync
```

## 🙏 Credits

- [NvChad](https://github.com/NvChad/NvChad) - The amazing base configuration
- [LazyVim](https://github.com/LazyVim/starter) - Inspiration for the starter structure
- The Neovim community for all the fantastic plugins

## 📝 License

This configuration inherits the same license as NvChad.
# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a modular fork of kickstart.nvim - a starting point for Neovim configuration that emphasizes readability and modularity. It's not a distribution but a foundation for building your own Neovim setup.

## Architecture

The configuration uses a modular structure that splits functionality across multiple files:

### Core Structure
- `init.lua` - Entry point that sets leader keys and requires all other modules
- `lua/options.lua` - Neovim options and settings
- `lua/keymaps.lua` - Basic key mappings
- `lua/lazy-bootstrap.lua` - Lazy.nvim plugin manager setup
- `lua/lazy-plugins.lua` - Main plugin configuration and loading

### Plugin Organization
- `lua/kickstart/plugins/` - Standard kickstart plugin configurations
- `lua/custom/plugins/` - User-specific custom plugin configurations
- Plugins are loaded via `require` statements in `lazy-plugins.lua`
- Custom plugins are auto-imported via `{ import = 'custom.plugins' }`

### Custom Configuration
- `lua/custom/init.lua` - Loads custom configurations
- `lua/custom/backups.lua` - Backup settings
- `lua/custom/disable-providers.lua` - Provider disabling
- `lua/custom/filetypes.lua` - Custom filetype configurations

## Plugin Management

### Key Commands
- `:Lazy` - View plugin status and management interface
- `:Lazy update` - Update all plugins
- `:Lazy sync` - Synchronize plugin state
- `:checkhealth` - Check Neovim health and plugin issues

### Adding Plugins
1. Add plugin to `lua/lazy-plugins.lua` or create new file in `lua/custom/plugins/`
2. Use `require 'path.to.plugin'` syntax for modular approach
3. Restart Neovim to load new plugins

## Development Workflow

### Health Checks
Always run `:checkhealth` after making configuration changes to identify issues.

### Key Mappings
- Leader key is `<space>`
- `<space>sh` - Search help documentation (very useful for learning)
- `<space>sr` - Resume last telescope search

### Plugin Structure
Each plugin file should return a table with plugin specification compatible with lazy.nvim. See existing files in `lua/kickstart/plugins/` for examples.

## Dependencies

External tools required for full functionality:
- `git`, `make`, `unzip`, C compiler
- `ripgrep` and `fd-find` (for telescope)
- Clipboard tool (xclip/xsel/win32yank)
- Nerd Font (optional, controlled by `vim.g.have_nerd_font` in init.lua)

## Configuration Principles

1. **Modularity** - Each plugin/feature in its own file
2. **Readability** - Every configuration should be understandable
3. **Documentation** - Extensive comments explaining purpose and usage
4. **Lazy Loading** - Plugins load when needed for performance
5. **Customization** - Easy to modify without breaking core functionality

The configuration prioritizes learning and understanding over convenience - every line should be readable and modifiable by the user.
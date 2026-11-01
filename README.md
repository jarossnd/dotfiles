# Arch Linux Dotfiles

Personal dotfiles and configuration files for my Arch Linux desktop environment.

This repository uses a **bare Git repository** to manage configuration files directly from my home directory without symlinks or a separate dotfiles manager.

## Environment

| Component | Software |
|---|---|
| Operating System | Arch Linux |
| Desktop Environment | GNOME / Wayland |
| Terminal | Alacritty |
| Terminal Theme | Catppuccin Mocha |
| Primary Font | MonoLisa |
| Icon Font | Symbols Nerd Font |
| Shell | Zsh |
| Text Editor | Neovim |
| Neovim Plugin Manager | vim.pack |
| File Explorer | Neo-tree |

## 1. Install Core Packages

Update Arch Linux and install the primary development packages:

```bash
sudo pacman -Syu --needed \
  git \
  github-cli \
  base-devel \
  neovim \
  alacritty \
  zsh \
  nodejs \
  npm \
  ripgrep \
  fd \
  wl-clipboard
```

## 2. Fonts

### MonoLisa

MonoLisa is a commercial font and must be installed separately from a licensed copy. Font files are not included in this repository.

After installing MonoLisa, rebuild the font cache:

```bash
fc-cache -f
```

Verify the installation:

```bash
fc-list : family | grep -i monolisa
```

### Nerd Font Symbols

Install the Nerd Font Symbols package to enable icons in Neo-tree and other terminal applications.

```bash
sudo pacman -S --needed ttf-nerd-fonts-symbols
```

Configure Fontconfig to use Symbols Nerd Font as a fallback for MonoLisa.

Configuration file:

`~/.config/fontconfig/conf.d/75-monolisa-nerd.conf`

```xml
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
  <match target="pattern">
    <test name="family" qual="any">
      <string>MonoLisa</string>
    </test>
    <edit name="family" mode="append" binding="strong">
      <string>Symbols Nerd Font</string>
    </edit>
  </match>
</fontconfig>
```

Refresh the cache and restart the terminal:

```bash
fc-cache -f
```

Test the icon rendering:

```bash
printf 'Lua:   Folder:   Open:   Git: \n'
```

## 3. Alacritty

Main configuration:

`~/.config/alacritty/alacritty.toml`

The terminal uses MonoLisa and imports the Catppuccin Mocha theme.

```toml
[general]
import = [
    "~/.config/alacritty/catppuccin-mocha.toml"
]

[font]
size = 12.0

[font.normal]
family = "MonoLisa"
style = "Regular"

[font.bold]
family = "MonoLisa"
style = "Bold"

[font.italic]
family = "MonoLisa"
style = "Italic"

[font.bold_italic]
family = "MonoLisa"
style = "Bold Italic"
```

The Catppuccin theme file is stored alongside the main Alacritty configuration.

## 4. Neovim

Neovim uses a custom Lua configuration with the built-in `vim.pack` plugin manager (Neovim 0.12+).

Configuration directory:

`~/.config/nvim/`

### Plugins

Key plugins used or planned:

| Plugin | Purpose |
|---|---|
| catppuccin/nvim | Colorscheme |
| neo-tree.nvim | File explorer |
| nvim-web-devicons | File-type icons |
| telescope.nvim | Fuzzy finding |
| plenary.nvim | Shared plugin dependency |
| nvim-treesitter | Syntax highlighting |
| gitsigns.nvim | Git change indicators |
| github/copilot.vim | AI code suggestions |

Plugin declarations are maintained in:

`~/.config/nvim/lua/jaross/plugins.lua`

Individual plugin configurations are maintained in separate Lua modules.

### Plugin Management

Install plugins by adding their repository URLs to `vim.pack.add()`.

Update installed plugins from Neovim:

```vim
:packupdate
```

Inspect installed packages:

```vim
:lua vim.print(vim.pack.get())
```

### Neo-tree

Configuration:

`~/.config/nvim/lua/jaross/neo-tree.lua`

Open or toggle the file explorer:

```vim
:Neotree toggle
```

Neo-tree uses `nvim-web-devicons` and the configured Nerd Font fallback to display file icons.

### GitHub Copilot

Authenticate GitHub Copilot using:

```vim
:Copilot setup
```

Check authentication and status:

```vim
:Copilot status
```

## 5. Restore Dotfiles on a Fresh Arch Installation

This repository is managed using a bare Git repository.

Clone the repository using HTTPS:

```bash
git clone --bare https://github.com/jarossnd/dotfiles.git "$HOME/.dotfiles"
```

Create the Git alias:

```bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

Restore the tracked files:

```bash
dotfiles checkout
```

**Important:** Checkout may fail if fresh-installation configuration files already exist at the same paths. Back up or move conflicting files before retrying; do not blindly overwrite them.

Hide untracked home-directory files:

```bash
dotfiles config --local status.showUntrackedFiles no
```

Persist the alias in `~/.zshrc` if it is not already included in the restored configuration.

After restoring the files, install the required packages and fonts, then open Neovim to install the declared plugins.

## 6. Managing Dotfiles

Check changes:

```bash
dotfiles status
```

Track configuration updates:

```bash
dotfiles add .config/nvim/
dotfiles add .config/alacritty/
dotfiles add .config/fontconfig/
dotfiles add README.md
```

Commit changes:

```bash
dotfiles commit -m "Update development configuration"
```

Push to GitHub:

```bash
dotfiles push
```

## Notes

- Do not commit licensed MonoLisa font files.
- Do not commit passwords, private keys, access tokens, or other secrets.
- Keep Neovim's plugin lockfile tracked for reproducible plugin versions.
- Update this README whenever new software, plugins, fonts, or configuration dependencies are introduced.
- The package list above documents the core development environment, not every package installed on the system.


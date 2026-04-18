# dotfiles

Dotfiles managed with a [bare git repository](https://www.atlassian.com/git/tutorials/dotfiles). The git directory lives at `~/.dotfiles` with `$HOME` as the work tree.

## Overview

Gruvbox Material dark theme across the full stack: Hyprland, Neovim, Tmux, Ghostty, and Waybar. FiraCode Nerd Font throughout.

## What's Included

| Category | Config | Details |
|---|---|---|
| Shell | `.zshrc`, `.zprofile`, `.p10k.zsh` | Oh-My-Zsh, Powerlevel10k, zsh-vi-mode, autosuggestions, fast-syntax-highlighting |
| Editor | `.config/nvim/` | LazyVim with gruvbox-material, claudecode.nvim, LaTeX, tmux.nvim |
| Terminal | `.config/ghostty/` | Ghostty with gruvbox-material, FiraCode Nerd Font |
| Multiplexer | `.tmux.conf`, `.tmux/themes/` | Gruvbox Material theme, tmux-resurrect/continuum, seamless Neovim navigation |
| Window Manager | `.config/hypr/` | Hyprland: modular config (keybinds, rules, execs, idle, lock, sunset) |
| Status Bar | `.config/waybar/` | Waybar with custom CSS |
| Launcher | `.config/wofi/` | Wofi with custom styling |
| Notifications | `.config/dunst/` | Dunst notification daemon |
| Git | `.gitconfig`, `.gitignore` | Neovim as diff/merge tool, default branch main |
| macOS WM | `.config/aerospace/` | Aerospace tiling window manager for cross-platform use |
| Other | Various | wluma, spotify-launcher, GTK settings, Proton VPN |

## Key Workflow Features

- **Seamless navigation** between Tmux panes and Neovim splits with Ctrl+hjkl
- **Session persistence** via tmux-resurrect and tmux-continuum (auto-save every 10 min, auto-restore on boot)
- **Claude Code integration** in Neovim with dedicated keybinds (`<leader>a`)
- **Vi keybindings** everywhere: Zsh, Tmux copy mode, Neovim
- **Cross-platform** support with Aerospace config for macOS alongside Hyprland for Linux

## Dependencies

System packages that need to be installed before setup. Shell plugins (oh-my-zsh, p10k), Tmux plugins (tpm), and Neovim plugins (lazy.nvim) are installed automatically by their respective plugin managers.

### Core

| Package | Purpose |
|---|---|
| zsh | Shell |
| neovim | Editor |
| tmux | Terminal multiplexer |
| ghostty | Terminal emulator |
| git | Version control |
| lazygit | Git TUI |
| fzf | Fuzzy finder (used by LazyVim picker) |
| fd | File finder (used by LazyVim picker) |

### Desktop (Hyprland/Wayland)

| Package | Purpose |
|---|---|
| hyprland | Window manager |
| waybar | Status bar |
| wofi | Application launcher |
| dunst | Notification daemon |
| hypridle | Idle management |
| hyprlock | Screen lock |
| hyprsunset | Color temperature |
| swaybg | Wallpaper |
| wluma | Automatic brightness |
| grim | Screenshots |
| slurp | Region selection |
| wf-recorder | Screen recording |
| wl-clipboard | Wayland clipboard (wl-copy/wl-paste) |
| polkit-kde-agent | Authentication agent |
| gnome-keyring | Credential management |

### System and Media

| Package | Purpose |
|---|---|
| wireplumber | PipeWire session manager |
| pavucontrol | Audio control UI |
| brightnessctl | Brightness control |
| playerctl | Media player control |
| blueman | Bluetooth manager |
| nm-applet | NetworkManager applet |
| networkmanager | Network management (provides nmtui) |

### Development

| Package | Purpose |
|---|---|
| rust/cargo | Rust toolchain |
| pnpm | Node.js package manager |
| ripgrep | Fast search (used by LazyVim and scripts) |
| jq | JSON processor |
| zathura | PDF viewer (LaTeX workflow) |
| texlive | LaTeX distribution (for vimtex) |

### Applications (optional)

firefox, signal-desktop, element-desktop, spotify, vlc, freetube, stremio, steam, tor-browser, zoom, jitsi-meet-desktop, protonvpn-app, dolphin, htop

## Installation (macOS)

### 1. Install Homebrew

See <https://brew.sh>

### 2. Install Firefox

```sh
brew install --cask firefox
```

Set up your password manager and log in to GitHub.

### 3. Set up SSH keys for GitHub

Generate a key and register it at <https://github.com/settings/keys>.

### 4. Clone and checkout

```sh
git clone --bare git@github.com:ciaranbor/dotfiles.git $HOME/.dotfiles
alias dfgit='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dfgit checkout
```

If checkout fails due to existing files, back them up first or use `dfgit checkout 2>&1 | grep "\t" | awk '{print $1}' | xargs -I{} mv {} {}.bak`.

### 5. Install packages

```sh
brew bundle --file=~/Brewfile
```

### 6. Run the install script

Switch to Ghostty, then:

```sh
~/scripts/install_or_update_config.sh
```

This installs Oh-My-Zsh with plugins, Powerlevel10k, and the Tmux plugin manager. Restart your shell afterwards.

### 7. Post-install

- Open `nvim` — lazy.nvim will auto-install plugins on first launch.
- Open `tmux`, press `prefix + I` to install tmux plugins.
- Install Rust: `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`

## Machine-Specific Config

Per-machine settings use `.local` suffix files that are sourced but not tracked:

- `.zshrc.local`, `.zshrc.plugins.local` — shell overrides
- `.p10k.zsh.local` — prompt overrides
- `.tmux.conf.local` — tmux overrides
- `.config/hypr/monitors.conf` — display configuration

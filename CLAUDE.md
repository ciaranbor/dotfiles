# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Structure

This is a **bare git repository** managing dotfiles using the [Atlassian method](https://www.atlassian.com/git/tutorials/dotfiles). The git directory is `~/.dotfiles` and the work tree is `$HOME`.

**Key commands:**
- `dfgit` — alias for `git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME` (defined in `.zshrc`)
- `ldf` / `lgit` — lazygit wrappers for the dotfiles repo
- To track a new file: `dfgit add ~/.config/foo/bar.conf && dfgit commit -m "Add foo config"`

## What's Managed

- **Shell:** `.zshrc`, `.zprofile`, `.p10k.zsh` — oh-my-zsh with powerlevel10k, plugins: git, zsh-vi-mode, zsh-autosuggestions, fast-syntax-highlighting
- **Neovim:** `.config/nvim/` — LazyVim-based Lua config with plugins: claudecode, gruvbox, latex, tmux integration
- **Tmux:** `.tmux.conf`, `.tmux/themes/gruvbox-material`
- **Git:** `.gitconfig`, `.gitignore`
- **Hyprland:** `.config/hypr/` — split into `hyprland.conf` (main), `keybinds.conf`, `rules.conf`, `execs.conf`, `hypridle.conf`, `hyprlock.conf`, `hyprsunset.conf`, `envs.conf`. Machine-specific `monitors.conf` is sourced but not tracked.
- **Waybar:** `.config/waybar/config`, `.config/waybar/style.css`
- **Ghostty:** `.config/ghostty/config.ghostty` (terminal emulator)
- **Wofi:** `.config/wofi/config`, `.config/wofi/style.css` (app launcher)
- **Dunst:** `.config/dunst/dunstrc`, `.config/dunst/notify` (notifications)
- **Aerospace:** `.config/aerospace/aerospace.toml` (macOS window manager, for cross-platform use)
- **Other:** wluma, spotify-launcher, GTK settings, Proton VPN, `scripts/install_or_update_config.sh`

## Conventions

- Machine-specific config uses `.local` suffix files (`.zshrc.local`, `.zshrc.plugins.local`, `.p10k.zsh.local`, etc.) which are sourced but **not tracked** in git
- Hyprland config uses untracked `monitors.conf` and `envs.conf` for per-machine settings
- Default editor is `nvim`; `vim` is aliased to `nvim`
- Auto-starts Hyprland from tty1 via `.zprofile`

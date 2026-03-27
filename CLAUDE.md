# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Structure

This is a **bare git repository** managing dotfiles using the [Atlassian method](https://www.atlassian.com/git/tutorials/dotfiles). The git directory is `~/.dotfiles` and the work tree is `$HOME`.

**Key commands:**
- `dfgit` — alias for `git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME` (defined in `.zshrc`)
- `ldf` / `lgit` — lazygit wrappers for the dotfiles repo
- To track a new file: `dfgit add ~/.config/foo/bar.conf && dfgit commit -m "Add foo config"`

**Branches:** `main` (Hyprland/Wayland), `sway` (legacy Sway config)

## What's Managed

- **Shell:** `.zshrc`, `.zprofile` — oh-my-zsh with powerlevel10k, plugins: git, zsh-vi-mode, zsh-autosuggestions, fast-syntax-highlighting
- **Hyprland:** `.config/hypr/` — split into `hyprland.conf` (main), `keybinds.conf`, `rules.conf`, `execs.conf`, `hypridle.conf`, `hyprlock.conf`, `hyprsunset.conf`. Machine-specific files (`monitors.conf`, `envs.conf`) are sourced but not tracked.
- **Waybar:** `.config/waybar/config`, `.config/waybar/style.css`
- **Other:** wluma, spotify-launcher, GTK settings, Proton VPN

## Conventions

- Machine-specific config uses `.local` suffix files (`.zshrc.local`, `.zshrc.plugins.local`, `.p10k.zsh.local`, etc.) which are sourced but **not tracked** in git
- Hyprland config uses untracked `monitors.conf` and `envs.conf` for per-machine settings
- Default editor is `nvim`; `vim` is aliased to `nvim`
- Auto-starts Hyprland from tty1 via `.zprofile`

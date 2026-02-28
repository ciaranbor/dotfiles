# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="${HOME}/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

ZVM_SYSTEM_CLIPBOARD_ENABLED=true

plugins=(
    git
    zsh-vi-mode
    zsh-autosuggestions
    fast-syntax-highlighting
)

# Allow local machines to add plugins
[[ -f ~/.zshrc.plugins.local ]] && source ~/.zshrc.plugins.local

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.cargo/env ]] || . "$HOME/.cargo/env"

export EDITOR='nvim'
export VISUAL='nvim'

alias shut="shutdown now"
alias ta="tmux attach"
alias vim="nvim"

dfgit() {
    git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME "$@"
}

lgit() {
    lazygit --git-dir=$HOME/.dotfiles --work-tree=$HOME
}

export LANG="en_IE.UTF-8"
export LC_CTYPE="en_IE.UTF-8"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Settings specific to the local system
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
[[ -f ~/.p10k.zsh.local ]] && echo "source ~/.p10k.zsh.local" >> ~/.p10k.zsh
[[ -f ~/.vimrc.local ]] && echo "source ~/.vimrc.local" >> ~/.vimrc
[[ -f ~/.tmux.conf.local ]] && echo "source ~/.tmux.conf.local" >> ~/.tmux.conf

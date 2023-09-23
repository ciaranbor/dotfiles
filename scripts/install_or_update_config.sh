#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m' # No Color

SKIP_HYPRLAND=false

while [[ $# -gt 0 ]]; do
	case $1 in
	--skip-hyprland)
		SKIP_HYPRLAND=true
		shift
		;;
	*)
		echo "Unknow option: $1"
		exit 1
		;;
	esac
done

#
# zsh
#
echo -e "${GREEN}Configuring OhMyZsh...${NC}"

if [[ ! -d ~/.oh-my-zsh ]]; then
	sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
	pushd ~/.oh-my-zsh
	git pull
	popd
fi

if [[ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]]; then
	git clone https://github.com/zsh-users/zsh-autosuggestions \
		${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
else
	pushd ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	git pull
	popd
fi

if [[ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting ]]; then
	git clone https://github.com/zdharma-continuum/fast-syntax-highlighting \
		${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
else
	pushd ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
	git pull
	popd
fi

#
# powerlevel10k
#
echo -e "${GREEN}Configuring PowerLevel10k...${NC}"

if [[ ! -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ]]; then
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
else
	pushd ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
	git pull
	popd
fi

#
# vim
#
echo -e "${GREEN}Configuring Vim...${NC}"

if [[ ! -f ~/.vim/autoload/plug.vim ]]; then
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

mkdir -p ~/.vim/undodir

vim -c "PlugInstall --sync" +qa

#
# tmux
#
echo -e "${GREEN}Configuring Tmux...${NC}"

if [[ ! -d ~/.tmux/plugins/tpm ]]; then
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
	pushd ~/.tmux/plugins/tpm
	git pull
	popd
fi

#
# Qutebrowser
#
/usr/share/qutebrowser/scripts/dictcli.py install en-GB

#
# Hyprload
#

if [ "$SKIP_HYPRLAND" = false ]; then
	if [[ ! -d ~/.local/share/hyprload ]]; then
		curl -sSL https://raw.githubusercontent.com/Duckonaut/hyprload/main/install.sh | bash
	fi
fi

#
# Done
#
echo -e "${GREEN}Configuration complete.${NC}"

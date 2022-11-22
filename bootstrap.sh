#! /bin/bash
#           :::::::::  :::::::::: :::::::::  :::        ::::::::  :::   :::
#          :+:    :+: :+:        :+:    :+: :+:       :+:    :+: :+:   :+:
#         +:+    +:+ +:+        +:+    +:+ +:+       +:+    +:+  +:+ +:+
#        +#+    +:+ +#++:++#   +#++:++#+  +#+       +#+    +:+   +#++:
#       +#+    +#+ +#+        +#+        +#+       +#+    +#+    +#+
#      #+#    #+# #+#        #+#        #+#       #+#    #+#    #+#
#     #########  ########## ###        ########## ########     ###
#
# >> https://gitlab.com/obyx/dotfiles <<

DOTFILES_PATH="$HOME/.f"
REPO_PATH="$HOME/.local/repos"

mkdir -p $DOTFILES_PATH
mkdir -p $REPO_PATH

aur_setup() {
	printf '\n\033[1;7;33m%s\033[0m\n' 'Setting up AUR helper'
	git clone 'https://aur.archlinux.org/paru.git' "$REPO_PATH/paru"
	cd "$REPO_PATH/paru" || exit 1
	makepkg -si
	cd "$DOTFILES_PATH" || exit 1
}

install_packages() {
	printf '\n\033[1;7;34m%s\033[0m\n' 'Installing packages'
	paru -S --skipreview $(sed -e 's/#.*$//g' $DOTFILES_PATH/package-list | tr -d "\n")
}

symlink_dotfiles() {
	git clone 'https://git.obyx.cc/obyx/dotfiles'
	cd "$DOTFILES_PATH" || exit 1
	printf '\n\033[1;7;36m%s\033[0m\n' 'Symlink to ~'
	stow -v */
}

install_dwm() {
	printf '\n\033[1;7;33m%s\033[0m\n' 'Installing dwm'
	git clone 'https://git.obyx.cc/obyx/dwm' "$REPO_PATH/dwm"
	cd "$REPO_PATH/dwm" || exit 1
	sudo make clean install && make clean
	cd "$DOTFILES_PATH" || exit 1
}

install_st() {
	printf '\n\033[1;7;33m%s\033[0m\n' 'Installing st'
	git clone 'https://git.obyx.cc/obyx/st' "$REPO_PATH/st"
	cd "$REPO_PATH/st" || exit 1
	sudo make clean install && make clean
	cd "$DOTFILES_PATH" || exit 1
}

install_dmenu() {
	printf '\n\033[1;7;33m%s\033[0m\n' 'Installing dmenu'
	git clone 'https://git.obyx.cc/obyx/dmenu' "$REPO_PATH/dmenu"
	cd "$REPO_PATH/dmenu" || exit 1
	sudo make clean install && make clean
	cd "$DOTFILES_PATH" || exit 1
}

extra() {
	printf '\n\033[1;7;33m%s\033[0m\n' 'Setting up wallpapers'
	mkdir -p $HOME/.local/share/
	mkdir -p $HOME/pics/
	printf 'Grabbing wallpapers...\n' && git clone 'https://git.obyx.cc/obyx/wallpapers' "$HOME/pics/wallpapers"
	printf '\n\033[1;7;33m%s\033[0m\n' 'Finishing up'
	chsh -s '/usr/bin/zsh'
}

aur_setup
install_packages
symlink_dotfiles
install_dwm
install_st
install_dmenu
extra

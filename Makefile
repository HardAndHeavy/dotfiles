# Attention! The int-zsh command must be the last one, because after it is executed, the terminal switches to zsh
inst: inst-before inst-neovim link inst-zsh

inst-before:
	sudo apt update
	sudo apt install -yy curl

inst-zsh:
	sudo apt install -yy zsh zsh-syntax-highlighting
	if [ ! -d ~/.oh-my-zsh ]; then sh -c "$$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"; fi

inst-neovim:
	sudo apt install -yy silversearcher-ag neovim

link:
	mkdir -p ~/.config/nvim
	ln -sf $(PWD)/files/.vimrc ~/.config/nvim/init.vim
	ln -sf $(PWD)/files/.zshrc ~/.zshrc
	mkdir -p ~/.config/autostart
	ln -sf $(PWD)/files/terminal.desktop ~/.config/autostart/terminal.desktop
	ln -sf $(PWD)/files/obsidian.desktop ~/.config/autostart/obsidian.desktop
	ln -sf $(PWD)/files/yandex-browser.desktop ~/.config/autostart/yandex-browser.desktop

desktop-link:
	ln -sf /data/ydisk/Проекты/Провенто ~/provento
	mkdir -p ~/.config/yandex-disk
	ln -sf /data/ydisk/settings/$(name)/ydisk-config.cfg ~/.config/yandex-disk/config.cfg
	sudo ln -sf /data/ydisk/settings/$(name)/hosts /etc/hosts

az-link: desktop-link
	ln -sf /data/python-data /projects/python-docker/data

buki-link: desktop-link

vedi-link:
	sudo ln -sf /data/docker /var/lib/docker

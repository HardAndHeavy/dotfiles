inst: inst-before inst-zsh inst-neovim inst-tmux link

inst-before:
	sudo apt update
	sudo apt install -yy curl fuse libfuse2

inst-zsh:
	sudo apt install -yy zsh zsh-syntax-highlighting
	if [ ! -d ~/.oh-my-zsh ]; then sh -c "$$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"; fi

inst-neovim:
	sudo apt install -yy silversearcher-ag
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
	chmod u+x nvim.appimage
	sudo mv nvim.appimage /usr/local/bin/nvim
	rm -rf nvim.appimage

inst-tmux:
	sudo apt install -yy tmux

link:
	ln -sf $(PWD)/files/.tmux.conf ~/.tmux.conf
	mkdir -p ~/.config/nvim
	ln -sf $(PWD)/files/.vimrc ~/.config/nvim/init.vim
	ln -sf $(PWD)/files/.zshrc ~/.zshrc
	mkdir -p ~/.config/autostart
	ln -sf $(PWD)/files/terminal.desktop ~/.config/autostart/terminal.desktop
	ln -sf $(PWD)/files/obsidian.desktop ~/.config/autostart/obsidian.desktop
	ln -sf $(PWD)/files/yandex-browser.desktop ~/.config/autostart/yandex-browser.desktop
	ln -sf /data ~/data
	ln -sf /data/ydisk/Проекты/Провенто ~/provento

az-link:
	ln -sf /data/ydisk/settings/az/ydisk-config.cfg ~/.config/yandex-disk/config.cfg
	rm -rf ~/.ssh
	ln -sf /data/ydisk/settings/.ssh ~/.ssh
	sudo ln -sf /data/ydisk/settings/az/hosts /etc/hosts
	ln -sf /data/python-data /projects/python-docker/data

buki-link:
	ln -sf /data/ydisk/settings/buki/ydisk-config.cfg ~/.config/yandex-disk/config.cfg
	rm -rf ~/.ssh
	ln -sf /data/ydisk/settings/.ssh ~/.ssh
	sudo ln -sf /data/ydisk/settings/buki/hosts /etc/hosts

vedi-link:
	sudo ln -sf /data/docker /var/lib/docker

git-save-credential:
	git config --global credential.helper store

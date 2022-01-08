update-vb:
	sudo sh /media/cdrom0/VBoxLinuxAdditions.run

prepare: inst-zsh inst-neovim inst-tmux link

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
	ln -sf $(PWD)/.tmux.conf ~/.tmux.conf
	ln -sf $(PWD)/.vimrc ~/.config/nvim/init.vim
	ln -sf $(PWD)/.zshrc ~/.zshrc

git-save-credential:
	git config --global credential.helper store

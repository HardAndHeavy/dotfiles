update-vb:
	sudo sh /media/cdrom0/VBoxLinuxAdditions.run

prepare: inst-before inst-zsh inst-neovim inst-tmux link

inst-before:
	sudo apt update
	sudo apt install -yy curl libfuse2

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

git-save-credential:
	git config --global credential.helper store

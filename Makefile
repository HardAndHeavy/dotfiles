DOTFILES_PATH=/projects/dotfiles

update-vb:
	sudo sh /media/cdrom0/VBoxLinuxAdditions.run

prepare: inst-zsh inst-neovim inst-tmux link

inst-zsh:
	sudo apt install -yy zsh zsh-syntax-highlighting
	if [ ! -d ~/.oh-my-zsh ]; then sh -c "$$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"; fi

inst-neovim:
	sudo apt install -yy neovim silversearcher-ag

inst-tmux:
	sudo apt install -yy tmux

link:
	ln -sf $(DOTFILES_PATH)/.tmux.conf ~/.tmux.conf
	ln -sf $(DOTFILES_PATH)/.vimrc ~/.config/nvim/init.vim
	ln -sf $(DOTFILES_PATH)/.zshrc ~/.zshrc

git-save-credential:
	git config --global credential.helper store

inst: inst-before inst-docker inst-neovim link

inst-before:
	sudo apt update
	sudo apt upgrade -y
	sudo apt install -y curl unzip

inst-zsh: inst-before
	sudo apt install -yy zsh zsh-syntax-highlighting
	if [ ! -d ~/.oh-my-zsh ]; then \
		sh -c "$$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"; \
	fi

inst-docker:
	curl -fsSL https://get.docker.com | sudo sh

inst-neovim:
	./install_neovim.sh

link:
	mkdir -p ~/.config
	rm -rf ~/.config/nvim
	ln -sf $(PWD)/files/nvim ~/.config/nvim
	ln -sf $(PWD)/files/.zshrc ~/.zshrc

inst-for-me: set-git-config my-link
	./install_for_me.sh

set-git-config:
	git config --global user.name HardAndHeavy
	git config --global user.email HardAndHeavyMetal@yandex.ru

my-link:
	ln -sf /data/projects ~/projects
	ln -sf /data ~/data
	mkdir -p ~/.config/autostart
	ln -sf $(PWD)/files/terminal.desktop ~/.config/autostart/terminal.desktop
	ln -sf $(PWD)/files/yandex-browser.desktop ~/.config/autostart/yandex-browser.desktop
	mkdir -p ~/.local/share/applications
	ln -sf $(PWD)/files/musescore.desktop ~/.local/share/applications/musescore.desktop
	ln -sf /data/ydisk/Проекты/Провенто ~/provento

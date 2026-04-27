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
	sudo usermod -aG docker $(USER)

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
	ln -sf /data ~/data
	sudo ln -sf /data/projects /projects
	ln -sf /data/projects ~/projects
	ln -sf /data/ydisk ~/ydisk
	ln -sf /data/projects/zettelkasten ~/zettelkasten
	mkdir -p ~/.config/autostart
	ln -sf $(PWD)/files/terminal.desktop ~/.config/autostart/terminal.desktop
	ln -sf $(PWD)/files/yandex-browser.desktop ~/.config/autostart/yandex-browser.desktop
	ln -sf $(PWD)/files/max.desktop ~/.config/autostart/max.desktop
	mkdir -p ~/.local/share/applications
	ln -sf $(PWD)/files/musescore.desktop ~/.local/share/applications/musescore.desktop

inst-for-provento:
	sudo apt install -y freerdp3-x11
	ln -sf /data/ydisk/Проекты/Провенто ~/provento

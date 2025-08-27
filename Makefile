inst: inst-before inst-docker inst-neovim link

inst-before:
	sudo apt update
	sudo apt upgrade -yy
	sudo apt install -yy curl unzip

inst-zsh: inst-before
	sudo apt install -yy zsh zsh-syntax-highlighting
	if [ ! -d ~/.oh-my-zsh ]; then \
		sh -c "$$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"; \
	fi

inst-docker:
	./install_docker.sh

inst-neovim:
	./install_neovim.sh

inst-for-me:
	./install_for_me.sh

link:
	mkdir -p ~/.config
	rm -rf ~/.config/nvim
	ln -sf $(PWD)/files/nvim ~/.config/nvim
	ln -sf $(PWD)/files/.zshrc ~/.zshrc
	mkdir -p ~/.config/autostart
	ln -sf $(PWD)/files/terminal.desktop ~/.config/autostart/terminal.desktop
	ln -sf $(PWD)/files/yandex-browser.desktop ~/.config/autostart/yandex-browser.desktop
	mkdir -p ~/.local/share/applications
	ln -sf $(PWD)/files/musescore.desktop ~/.local/share/applications/musescore.desktop

my-link:
	ln -sf /data/ydisk/Проекты/Провенто ~/provento
	mkdir -p ~/.config/yandex-disk
	ln -sf /data/ydisk/settings/$(name)/ydisk-config.cfg ~/.config/yandex-disk/config.cfg
	sudo ln -sf /data/ydisk/settings/$(name)/hosts /etc/hosts

az-inst: inst-for-me my-link

buki-lnst: inst-for-me my-link

vedi-inst:
	sudo ln -sf /data/docker /var/lib/docker

sudo rm -rf /usr/bin/vi # Удаление старого Vim в Ubuntu

sudo apt install -yy \
  build-essential \
  ripgrep

FZF_VERSION=$(curl -s "https://api.github.com/repos/junegunn/fzf/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo fzf.tar.gz "https://github.com/junegunn/fzf/releases/download/v${FZF_VERSION}/fzf-${FZF_VERSION}-linux_amd64.tar.gz"
sudo tar -C /usr/bin -xf fzf.tar.gz
rm fzf.tar.gz

NEOVIM_VERSION=$(curl -s "https://api.github.com/repos/neovim/neovim/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -LO https://github.com/neovim/neovim/releases/download/v${NEOVIM_VERSION}/nvim-linux-x86_64.tar.gz
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
rm nvim-linux-x86_64.tar.gz
FILE="/etc/environment"
NEW_PATH="/opt/nvim-linux-x86_64/bin"
if grep -q '^PATH=' "$FILE"; then
    CURRENT_PATH=$(grep '^PATH=' "$FILE" | sed -e 's/^PATH=//' -e 's/"//g')
    case ":${CURRENT_PATH}:" in
        *":${NEW_PATH}:"*)
            echo "Путь $NEW_PATH уже присутствует в PATH. Изменения не требуются."
            ;;
        *)
            UPDATED_PATH="${CURRENT_PATH}:${NEW_PATH}"
            NEW_LINE="PATH=\"$UPDATED_PATH\""
            sudo sed -i "s|^PATH=.*|$NEW_LINE|" "$FILE"
            echo "Путь $NEW_PATH успешно добавлен в PATH"
            ;;
    esac
else
    CURRENT_PATH="${PATH}"
    case ":${CURRENT_PATH}:" in
        *":${NEW_PATH}:"*)
            NEW_LINE="PATH=\"$CURRENT_PATH\""
            ;;
        *)
            UPDATED_PATH="${CURRENT_PATH}:${NEW_PATH}"
            NEW_LINE="PATH=\"$UPDATED_PATH\""
            ;;
    esac
    echo "$NEW_LINE" | sudo tee -a "$FILE" > /dev/null
    echo "Создана новая строка PATH: $NEW_LINE"
fi

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
rm lazygit.tar.gz
sudo install lazygit -D -t /usr/local/bin/
rm -rf lazygit

FONTS_VERSION=$(curl -s "https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
mkdir ~/.fonts
curl -Lo IBMPlexMono.zip "https://github.com/ryanoasis/nerd-fonts/releases/download/v${FONTS_VERSION}/IBMPlexMono.zip"
unzip IBMPlexMono.zip -d IBMPlexMono
rm -rf ~/.fonts/IBMPlexMono
mv IBMPlexMono ~/.fonts
rm IBMPlexMono.zip

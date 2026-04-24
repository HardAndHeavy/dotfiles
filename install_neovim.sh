sudo apt install -y \
  build-essential \
  ripgrep \
  neovim \
  fzf \
  lazygit

FONTS_VERSION=$(curl -s "https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
mkdir ~/.fonts
curl -Lo IBMPlexMono.zip "https://github.com/ryanoasis/nerd-fonts/releases/download/v${FONTS_VERSION}/IBMPlexMono.zip"
unzip IBMPlexMono.zip -d IBMPlexMono
rm -rf ~/.fonts/IBMPlexMono
mv IBMPlexMono ~/.fonts
rm IBMPlexMono.zip

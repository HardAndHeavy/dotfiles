sudo apt install -y \
  build-essential \
  ripgrep \
  neovim \
  fzf \
  lazygit

# Nerd Fonts
font_dir="${HOME}/.local/share/fonts"
mkdir -p "$font_dir"
if ! fc-list :family | grep -qi "IBM Plex Mono"; then
    ver=$(curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | grep -oP '"tag_name":\s*"v\K[^"]+')
    tmp=$(mktemp -d)
    curl -fsSL "https://github.com/ryanoasis/nerd-fonts/releases/download/v${ver}/IBMPlexMono.zip" -o "${tmp}/fonts.zip"
    unzip -q "${tmp}/fonts.zip" -d "${tmp}/extract"
    find "${tmp}/extract" -name "*.ttf" -exec cp {} "$font_dir/" \;
    fc-cache -fv "$font_dir" &>/dev/null || true
    rm -rf "$tmp"
fi

set -euo pipefail

apt update && apt install -y build-essential ripgrep curl wget unzip fontconfig

# Neovim через PPA
if ! command -v nvim &>/dev/null; then
    add-apt-repository -y ppa:neovim-ppa/stable
    apt update && apt install -y neovim
fi

# fzf
if ! command -v fzf &>/dev/null; then
    ver=$(curl -s https://api.github.com/repos/junegunn/fzf/releases/latest | grep -oP '"tag_name":\s*"v\K[^"]+')
    curl -fsSL "https://github.com/junegunn/fzf/releases/download/v${ver}/fzf-${ver}-linux_amd64.tar.gz" | \
        sudo tar -xzf - -C /usr/local/bin fzf
fi

# lazygit
if ! command -v lazygit &>/dev/null; then
    ver=$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest | grep -oP '"tag_name":\s*"v\K[^"]+')
    curl -fsSL "https://github.com/jesseduffield/lazygit/releases/download/v${ver}/lazygit_${ver}_Linux_x86_64.tar.gz" | \
        sudo tar -xzf - -C /usr/local/bin lazygit
fi

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

# PATH и переменные окружения
profile="/etc/profile.d/neovim-dev.sh"
[[ -f "$profile" ]] || cat <<'EOF' > "$profile"
export PATH="/usr/local/bin:$PATH"
export EDITOR=nvim
export VISUAL=nvim
EOF

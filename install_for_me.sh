sudo apt install -y \
  keepass2 \
  htop \
  vlc \
  ardour \
  krita
sudo snap install \
  blender \
  telegram-desktop

# Yandex Browser
sudo tee /etc/apt/sources.list.d/yandex-browser.sources > /dev/null <<EOF
Types: deb
URIs: https://repo.yandex.ru/yandex-browser/deb/
Suites: stable
Components: main
Signed-By: /etc/apt/trusted.gpg.d/yandex-browser.gpg
EOF
sudo curl -fsSL https://repo.yandex.ru/yandex-browser/YANDEX-BROWSER-KEY.GPG -o /etc/apt/trusted.gpg.d/yandex-browser.gpg
sudo apt update
sudo apt install -y yandex-browser-stable

# Yandex Disk
echo "deb [signed-by=/etc/apt/trusted.gpg.d/yandex-disk.gpg] http://repo.yandex.ru/yandex-disk/deb/ stable main" | sudo tee /etc/apt/sources.list.d/yandex-disk.list > /dev/null
sudo curl -fsSL https://repo.yandex.ru/yandex-disk/YANDEX-DISK-KEY.GPG -o /etc/apt/trusted.gpg.d/yandex-disk.gpg
sudo apt update
sudo apt install -y yandex-disk

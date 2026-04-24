sudo apt install -y \
  keepass2 \
  htop \
  vlc \
  ardour \
  krita
sudo snap install \
  blender \
  telegram-desktop

sudo mkdir -p /usr/share/keyrings

# Yandex Browser
printf '%s\n' \
  'Types: deb' \
  'URIs: https://repo.yandex.ru/yandex-browser/deb/' \
  'Suites: stable' \
  'Components: main' \
  'Signed-By: /usr/share/keyrings/yandex-browser.gpg' | \
  sudo tee /etc/apt/sources.list.d/yandex-browser.sources > /dev/null
curl -fsSL https://repo.yandex.ru/yandex-browser/YANDEX-BROWSER-KEY.GPG | \
  sudo gpg --dearmor --yes -o /usr/share/keyrings/yandex-browser.gpg
sudo apt update
sudo apt install -y yandex-browser-stable

# Yandex Disk
echo "deb [signed-by=/usr/share/keyrings/yandex-disk.gpg] http://repo.yandex.ru/yandex-disk/deb/ stable main" | \
  sudo tee /etc/apt/sources.list.d/yandex-disk.list > /dev/null
curl -fsSL https://repo.yandex.ru/yandex-disk/YANDEX-DISK-KEY.GPG | \
  sudo gpg --dearmor --yes -o /usr/share/keyrings/yandex-disk.gpg
sudo apt update
sudo apt install -y yandex-disk

sudo apt install -y \
  keepass2 \
  htop \
  vlc \
  ardour \
  krita
sudo snap install blender --classic
sudo snap install telegram-desktop

sudo mkdir -p /usr/share/keyrings

# Yandex Browser
sudo rm -f /etc/apt/sources.list.d/yandex-browser.sources
sudo rm -f /usr/share/keyrings/yandex-browser.gpg
printf '%s\n' \
  'Types: deb' \
  'URIs: https://repo.yandex.ru/yandex-browser/deb/' \
  'Suites: stable' \
  'Components: main' \
  'Signed-By: /usr/share/keyrings/yandex-browser.gpg' | \
  sudo tee /etc/apt/sources.list.d/yandex-browser.sources > /dev/null
curl -fsSL https://repo.yandex.ru/yandex-browser/YANDEX-BROWSER-KEY.GPG | \
  sudo gpg --dearmor --yes -o /usr/share/keyrings/yandex-browser.gpg

# Yandex Disk
sudo rm -f /etc/apt/sources.list.d/yandex-disk.list
sudo rm -f /usr/share/keyrings/yandex-disk.gpg
echo "deb [signed-by=/usr/share/keyrings/yandex-disk.gpg] http://repo.yandex.ru/yandex-disk/deb/ stable main" | \
  sudo tee /etc/apt/sources.list.d/yandex-disk.list > /dev/null
curl -fsSL https://repo.yandex.ru/yandex-disk/YANDEX-DISK-KEY.GPG | \
  sudo gpg --dearmor --yes -o /usr/share/keyrings/yandex-disk.gpg

# Max
sudo rm -f /etc/apt/sources.list.d/max.list
sudo rm -f /etc/apt/keyrings/max.gpg
curl -fsSL https://download.max.ru/linux/deb/public.asc | sudo gpg --dearmor -o /etc/apt/keyrings/max.gpg >/dev/null
echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/max.gpg] https://download.max.ru/linux/deb stable main" | sudo tee /etc/apt/sources.list.d/max.list

sudo apt update
sudo apt install -y \
  yandex-browser-stable \
  yandex-disk \
  max

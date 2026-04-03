sudo apt-get install -y keepass2
sudo apt-get install -y htop
sudo apt-get install -y vlc # Видеоплеер
sudo apt-get install -y musescore # Нотная программа
sudo apt-get install -y ardour # Аудиоредактор
sudo snap install blender --channel=5.1/stable --classic # Видеоредактор

# Телеграм
curl -Lo tsetup.tar.xz https://telegram.org/dl/desktop/linux
sudo tar -xpf tsetup.tar.xz -C /opt
sudo ln -s /opt/Telegram/Telegram /usr/local/bin/telegram-desktop
sudo chmod -R 755 /opt/Telegram
rm tsetup.tar.xz

# Макс
MAX_GPG="/etc/apt/keyrings/max.gpg"
MAX_LIST="/etc/apt/sources.list.d/max.list"
MAX_REPO="deb [signed-by=/etc/apt/keyrings/max.gpg] https://download.max.ru/linux/deb stable main"

if [ ! -f "$MAX_GPG" ]; then
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.max.ru/linux/deb/public.asc | sudo gpg --dearmor -o "$MAX_GPG" >/dev/null
fi
if [ ! -f "$MAX_LIST" ] || ! grep -qF "download.max.ru" "$MAX_LIST"; then
    echo "➕ Добавляем репозиторий Max..."
    echo "$MAX_REPO" | sudo tee "$MAX_LIST" > /dev/null
    sudo apt update -y
fi
sudo apt install -y max

sudo apt-get install -y keepass2
sudo apt-get install -y htop
sudo apt-get install -y vlc # Видеоплеер
sudo apt-get install -y musescore # Нотная программа

# Телеграм
curl -Lo tsetup.tar.xz https://telegram.org/dl/desktop/linux
sudo tar -xpf tsetup.tar.xz -C /opt
sudo ln -s /opt/Telegram/Telegram /usr/local/bin/telegram-desktop
sudo chmod -R 755 /opt/Telegram
rm tsetup.tar.xz

## Requirements
* Ubuntu
* git
* make

## Setup

Before installation
```sh
sudo apt-get update
sudo apt-get upgrade -yy
sudo apt-get install -yy git make
git clone https://github.com/HardAndHeavy/dotfiles 
cd dotfiles
make inst-zsh
```

Installation
```sh
make inst
```

After installation
```sh
sudo reboot
```

Optional for my computers
```
make [name]-link name=[name]
```

## Tips

`sudo hostnamectl set-hostname NEW_NAME` - смена имени компьютера

## Vim
[LazyVim](https://www.lazyvim.org/)
Run `:LazyHealth` after installation. This will load all plugins and check if everything is working correctly. 

### Hotkeys
* Switch `<ctrl>` and `<caps lock>`
* Use `<ctrl> + [` instead of `<Esc>`
* `<leader>` – Space
* `:u` - отмена действия
* `:e!` - перечитать файл
* `<leader>sr` - глобальная замена в файле, после ввода надо нажать `/r`
* `^` - первый символ строки
* `0` - начало строки
* `$` - конец строки
* `gc` - комментирование
* `>` - в визуальном режиме сдвигает выделенный текст на tab
* `>>` - в режиме команд сдвигает строку на tab, если вначале указать число (`2>>`), то сдвинет столько строк
* `[b` - следующая вкладка вправо
* `]b` - следующая вкладка влево
* `<leader>/` - глобальный поиск
* `<leader><leader>` - поиск по каталогу проекта
* `<leader>e` - открыть дерево проекта
* `<leader>ft` - открыть терминал

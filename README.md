## Requirements
* Ubuntu
* git
* make

## Setup
```sh
sudo apt-get update
sudo apt-get upgrade -yy
sudo apt-get install -yy git make
git clone https://github.com/HardAndHeavy/dotfiles 
cd dotfiles
make inst-zsh
make inst
sudo reboot
```
to personal computer
```
make [name]-link name=[name]
```

## Vim
[LazyVim](https://www.lazyvim.org/)
Run `:LazyHealth` after installation. This will load all plugins and check if everything is working correctly. 

### Main
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

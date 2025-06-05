## Requirements
* Linux
* git (`sudo apt-get install git`)
* make (`sudo apt-get install make`)

## Setup
```sh
git clone https://github.com/HardAndHeavy/dotfiles 
cd dotfiles
make inst
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
* `<leader>sr` - глобальная замена в файле
* `^` - первый символ строки
* `0` - начало строки
* `$` - конец строки
* `gc` - комментирование
* [b - следующая вкладка вправо
* ]b - следующая вкладка влево
* <leader>/ - глобальный поиск
* <leader><leader> - поиск по каталогу проекта
* <leader>e - открыть дерево проекта

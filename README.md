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
Run `:PlugUpdate` after each pulling (git pull)

### Main
* Switch `<ctrl>` and `<caps lock>`
* Use `<ctrl> + [` instead of `<Esc>`
* `<leader>` – Space
* `:u` - отмена действия
* `:e!` - перечитать файл
* `:%s/foo/bar/g` - глобальная замена в файле
    * `:%s/ /[Ctrl+v][Enter]/g` - глобальная замена пробелов на перенос строки
* `^` - первый сиомвол строки
* `0` - начало строки
* `$` - конец строки

### Moving between visible buffers
* `<C-h>` – move left or open new left split
* `<C-l>` – move right or open new right split
* `<C-k>` – move up or open new top split
* `<C-j>` – move down or open new bottom split

### File Tree
* `<leader><leader>` – toggle filetree
* `<C-n>` – locate opened file in the filetree
* `o` – open directory or file

### Searching and Navigation
* `<leader> sf` – find files
* `<leader> sg` – git grep
* `<leader> sc` – find commits
* `<leader> so` – symbols
* `<leader> sr` – references
* `<leader> b` – show buffer list
* `<leader>S` – search & replace

### Редактирование
* Вначале надо выделить текст в визуальном режиме `v` передвигаясь по тексту `j, k, {, } и т. д.`, а затем набрать `:norm `:
    * 'i#` - закомментирует
    * `^x` - раскомментирует
    * `0d2l` - удалит с начала строки два символа
* `cc` - комментирование символом #
* `uc` - раскомментирование

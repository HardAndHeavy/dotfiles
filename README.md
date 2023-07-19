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
make [name]-link
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

### Комментирование
* Вначале надо выделить текст в визуальном режиме `v` передвигаясь по тексту `j, k, {, } и т. д.`, а затем набрать `:norm i#` или `cc`, `:norm ^x` или `uc`
* `cc` - комментирование символом #
* `uc` - раскомментирование

## Tmux
* `C-b [` - режим копирования. Передвижение с помощью стрелок
* `C-space` - начало копирования
* `C-w` - выход из режима копирования, копирование в буфер
* `C-b ]` - вставить из буфера

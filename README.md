# rustup.vim
A thin wrapper for calling [`rustup`](https://github.com/rust-lang-nursery/rustup.rs) from Vim

## Current status

* `rustup#component#list(toolchain)`
* `rustup#component#add(component, target, toolchain)`
* `rustup#component#remove(component, target, toolchain)`
* `rustup#override#list()`
* `rustup#override#set(toolchain)`
* `rustup#override#unset(path, nonexistent)`
* `rustup#target#list(toolchain)`
* `rustup#target#default(toolchain)`
* `rustup#target#add(target, toolchain)`
* `rustup#target#remove(target, toolchain)`
* `rustup#toolchain#list()`
* `rustup#toolchain#install(name)`
* `rustup#toolchain#default()`
* `rustup#show()`
* `rustup#default(toolchain)`
* `rustup#run(toolchain, cmd, ...)`
* `rustup#which(cmd)`

## Installation

vim-plug:

```vim
Plug 'ubnt-intrepid/rustup.vim'
```

dein.vim:

```vim
call dein#add('ubnt-intrepid/rustup.vim')
```

## License
This software is released under the MIT license.
See [LICENSE](LICENSE) for details.

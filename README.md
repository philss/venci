# Venci

- Vim, vi, venci

My [neovim](https://neovim.io/) configuration files.

## Dependencies

- git
- neovim ~> 0.5

Optional:

- [Powerline Fonts](https://github.com/powerline/fonts) - Needed for Airline

## How to install

First you need to install [vim-plug](https://github.com/junegunn/vim-plug),
which is a dependency manager for Vim.

After that, just clone the repo:

```
$ git clone https://github.com/philss/venci.git ~/.venci/
```

Add a symbolic link of `~/.config/nvim/init.vim` pointing to the `vimrc` file inside the repository.
You may need to remove the original `init.vim` file before do that.

```
$ rm ~/.config/nvim/init.vim
$ ln -s ~/.venci/vimrc ~/.config/nvim/init.vim
```

Then open vim and run `:PlugInstall`. It will take some minutes depending of your connection.
After that, restart your vim. Everything should be installed.

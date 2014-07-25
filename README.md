# Venci

- Vim, vi, venci

My Vim configuration files

## Dependencies

- [Vundle](https://github.com/gmarik/Vundle.vim)
- git

## How to install

First you need to install Vundle, which is a dependency manager for Vim.

```
$ mkdir -p ~/.vim/bundle
$ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

After install Vundle, you need to clone this repo:

```
$ git clone https://github.com/philss/venci.git ~/.venci/
```

And add a symbolic link of `~/.vimrc` pointing to the `vimrc` file inside the repository.
You may need to remove the original `~/.vimrc` file before do that.

```
$ ln -s /Users/your_username/.venci/vimrc ~/.vimrc
```

Them, open vim and run `:BundleInstall`. It will take some minutes depending of your connection.
After that, close and open your vim again. Everything should be installed.

# My `vimrc` file

I started to use vim in all my works in the beginning of 2013. So I started to
be ansious to find good plugins to make my vim more powerfull. Then I used the
vim configuration of joedicastro for one year until I get boring. It's a very
very nice `vimrc` file (https://github.com/joedicastro/dotfiles/tree/master/vim)
and I learned so much with it, but I prefer something simpler and more direct.

So I did my `vimrc` version 0 and you can see and get it here.

I'm still working in a version with more features and a better documentation.

# Prerequisites

## Vundle

I use vundle to manage vim plugins. To install it, follow the steps:

```bash
$ mkdir ~/.vim/bundle
$ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

When you start vim at first time, you need to install all the plugins by the
follow command:

```bash
:PluginInstall
```

## Powerline-fonts

To see arrows on the status bar powered by the plugin vim-airline, you will need
to configurate the powerline-fonts (it was downloaded if you already did the
`Vundle` section).

First, check if the directory `~/.fonts/` exists. If not, create it:

```bash
$ mkdir ~/.fonts/
```

Now link the downloaded fonts in `~/.fonts/` and reload:

```bash
$ cd ~/.fonts/
$ ln -s ~/.vim/bundle/powerline-fonts/ .
$ fc-cache ~/.fonts/
```

For last, you will maybe have to change the font of your terminal. Go to `Edit >
Profile Preferences > General > Fonts`. You can choose any font that contains
powerline in the name.

# Tips

1. I store my vimrc file into my Dropbox directory and my ~/.vimrc is a link to
   it. In this way, I can easier share my vim configurations between my
   diferents devices.

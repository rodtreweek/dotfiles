# My dotfiles repo

I use [Homesick](https://github.com/technicalpickles/homesick) to manage my dotfiles.
I also highly recommend that you read this book if you use vim: https://github.com/vjousse/vim-for-humans-book

## Installation

### Homebrew

1. `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`
1. Bettervim: `brew install vim --with-override-system-vi`
1. Other tools: `brew install git tmux thefuck ack the_silver_searcher rg tree nmap xz wget autossh cmake`
1. Use brew's Ruby: `brew install ruby ruby-build`
1. Install Xclip: first, `brew cask install xquartz` then: `brew install xclip`

### bash

1. bash_it: `sh -c "$(curl -fsSL https://raw.githubusercontent.com/Bash-it/bash-it/master/install.sh)"`
1. `mkdir ~/src`
1. `git clone https://github.com/rodtreweek/powerline-r ~/src/powerline-r`

### Zsh

oh-my-zsh: sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
mkdir ~/src
git clone https://github.com/bhilburn/powerlevel9k.git ~/src/powerlevel9k


### Homesick

1. Install Homesick with `gem install homesick`
1. Clone this castle with `homesick clone rodtreweek/dotfiles`
1. Create the symlinks with `homesick symlink dotfiles`

### Vim plugins
https://github.com/junegunn/vim-plug

1. Vimplug Install: `curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
1. Add a vim-plug section to your ~/.vimrc (or ~/.config/nvim/init.vim for Neovim):

Begin the section with call plug#begin()
List the plugins with Plug commands
call plug#end() to update &runtimepath and initialize plugin system
Automatically executes filetype plugin indent on and syntax enable. You can revert the settings after the call. e.g. filetype indent off, syntax off, etc.
1. Setup YouCompleteMe:
    1. `brew install cmake`
    1. `~/.vim/plugged/YouCompleteMe/install.py`

### Fonts

Install Awesome patched fonts to make vim-airline happy:

1. Download and install an Awesome patched font:
  * <https://github.com/gabrielelana/awesome-terminal-fonts/raw/patching-strategy/patched/Inconsolata%2BAwesome.ttf>
1. Switch iTerm2 to use that font for both **Font** and **Non ASCII Font**


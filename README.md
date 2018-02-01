# My dotfiles repo

[![Travis CI](https://travis-ci.org/rodtreweek/dotfiles.svg?branch=master)](https://travis-ci.org/rodtreweek/dotfiles)


I use [Josh Nichols'](https://github.com/technicalpickles) excellent [Homesick](https://github.com/technicalpickles/homesick) to manage my dotfiles.
I also recommend reading [vim-for-humans](https://github.com/vjousse/vim-for-humans-book) if you use vim.

## Installation

### ZSH

1. oh-my-zsh: `sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
1. `mkdir ~/src`
1. `git clone https://github.com/bhilburn/powerlevel9k.git ~/src/powerlevel9k`

### Homebrew

[Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle) for applications.

1. `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
1. Get Brew Bundler: `homesick cd && brew bundle`

### Gems

1. `gem install tmuxinator rubocop ruby-perl mailcatcher`

### Vim plugins

1. [Vim-Plug](https://github.com/junegunn/vim-plug) Install with: `curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
1. Install plugins: `vim +PlugInstall +qall`

### Homesick

1. Install Homesick with `gem install homesick`
1. Clone this castle with `homesick clone rodtreweek/dotfiles`
1. Create the symlinks with `homesick symlink dotfiles`

## Colors and Fonts

1. GruvBox color scheme for iterm2: 
* <https://github.com/morhetz/gruvbox-contrib/raw/master/iterm2/gruvbox-dark.itermcolors>
1. Awesome patched fonts:
* <https://github.com/gabrielelana/awesome-terminal-fonts/raw/patching-strategy/patched/Inconsolata%2BAwesome.ttf>
1. Switch iTerm2 to use this font for the *Non ASCII Font*

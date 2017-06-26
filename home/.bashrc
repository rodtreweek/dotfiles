################################################
# Aliases
################################################
alias tree='tree -C'
alias path='echo -e ${PATH//:/\\n}'

# Puppet aliases
alias plintl='puppet-lint --log-format="%{path} - %{KIND}:%{check} - %{message} on line %{line}"'
alias ppv="puppet parser validate"
alias plint='puppet-lint'

# Vagrant aliases
alias v='vagrant'
alias vs='vagrant status'
alias vhl='vagrant hosts list'
alias vscp='vaagrant scp'
alias vsl='vagrant snapshot list'
alias vst='vagrant snapshot take'

# Tmux aliases
alias tma='tmux attach -d -t'

# Bundler aliases
alias b='bundle'
alias be='bundle exec'
alias bi='bundle install'

# Shortcuts
alias d="cd ~/Documents/Dropbox"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias h="history"

# Git and Github aliases
alias cdg='cd "$(git rev-parse --show-toplevel)"'

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
  colorflag="--color"
else # OS X `ls`
  colorflag="-G"
fi

# List all files colorized in long format
alias l="ls -lF ${colorflag}"

# List all files colorized in long format, including dot files
alias la="ls -lAF ${colorflag}"

# List only directories
alias lsd="ls -l | grep --color=never '^d'"

# Always use color output for `ls`
alias ls="command ls ${colorflag}"
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Get week number
alias week='date +%V'

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a && brew update && brew upgrade --all && brew cleanup && brew cask cleanup && gem update --system && gem update && vagrant plugin update'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Canonical hex dump; some systems have this symlinked
command -v hd > /dev/null || alias hd="hexdump -C"

# OS X has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"

# OS X has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum"

# Recursively delete `.DS_Store` files
alias cleanupds="find . -type f -name '*.DS_Store' -ls -delete"

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
  alias "$method"="lwp-request -m '$method'"
done

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 7'"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# The Fuck alias
eval "$(thefuck --alias)"

#########################################################
# Functions
#########################################################

# Follow copied and moved files to destination directory 
cpf() { cp "$@" && goto "$_"; }
mvf() { mv "$@" && goto "$_"; }
goto() { [ -d "$1" ] && cd "$1" || cd "$(dirname "$1")"; }

# Ruby erb validation
verb() {
  erb -P -x -T '-' $1 | ruby -c
}

# Change the release.
function relup() {
  cd ~/nick-control-repo-vagrant
  re='^[0-9]+$'
  echo "Enter old release: "
  read old_release
  echo "Enter new release: "
  read new_release
  find -E . -type f -regex "(.*pp)|(.*yaml)" -exec sed -i '' "s/$old_release/$new_release/" {} +
}

function relup_pdk() {
  cd ~/rod_pdk
  re='^[0-9]+$'
  echo "Enter old release: "
  read old_release
  echo "Enter new release: "
  read new_release
  find -E . -type f -regex "(.*pp)|(.*yaml)" -exec sed -i '' "s/$old_release/$new_release/" {} +
}

# I'm lazy
function lzgit() {
    git add -A
    printf "Hello! You rule. Enter your commit message: "
    read commit_msg
    git commit -a -m "$commit_msg"
    git push
}

# Git functions
function gs() {
  git status
}

function grso() {
  git remote show origin
}

function grau() {
  git remote add upstream $1
}

function grv()  {
  git remote -v
}

# tmux
function tmk() {
  tmux kill-session -t $1
}

function tml() {
  tmux list-sessions
}

# usage: attach-session [-dEr] [-c working-directory] [-t target-session]
function tma() {
  tmux attach -t $1
}

# Functions for Vagrant
function vsnapdev() {
    for x in "$@"; do echo "adding vagrant hosts to dev snapshot group titled dev_group"
        vagrant snapshot save "$x" dev_group;
    done
}

function vsnapdev_go() {
    vagrant snapshot restore --no-provision dev_group;
}

function vhalt() {
      vagrant halt $1
}

function vssh() {
    vagrant ssh $1 -- -t 'sudo su -; /bin/bash'
}

# autossh function
function avssh() {
  autossh -M $(($RANDOM%6400 + 1024)) centos@$1 -p 22 -o Compression=yes -o DSAAuthentication=yes -o LogLevel=ERROR -o IdentitiesOnly=yes -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i /Users/rod/.ssh/id_rsa -t 'sudo su -; /bin/bash'
}

function vsnap() {
  vagrant snapshot take $1 init
}

# vmpooler
function vm-grab() {
    printf "Hello! You rule. Which vm would you like?: "
    read vm_msg
    LDAP_USERNAME=rod LDAP_PASSWORD=$(python -c 'import getpass;print(getpass.getpass())') vmpool grab "$vm_msg"
}

function vm-list() {
LDAP_USERNAME=rod LDAP_PASSWORD=$(python -c 'import getpass;print(getpass.getpass())') vmpool list
}

# YAML Validation
function yval() {
  ruby -e "require 'yaml'; YAML.load_file('$1')"
}

# copy public key to clipboard
function cpub() {
  pbcopy < ~/.ssh/id_rsa.pub
}

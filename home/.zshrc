export ZSH=$HOME/.oh-my-zsh
export ZPLUG_HOME=/usr/local/opt/zplug

# Set name of the theme to load.
TERM=xterm-256color
DEFAULT_USER="$USER"
# See also https://github.com/Falkor/dotfiles/blob/master/oh-my-zsh/
# Font taken from https://github.com/stefano-meschiari/dotemacs/blob/master/SourceCodePro%2BPowerline%2BAwesome%2BRegular.ttf
#
# Set name of the theme to load.
ZSH_THEME='powerlevel9k'

POWERLEVEL9K_MODE='awesome-patched'

# Disable dir/git icons
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''

DISABLE_AUTO_TITLE="true"

POWERLEVEL9K_VCS_GIT_ICON=''
POWERLEVEL9K_VCS_STAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'

POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
#POWERLEVEL9K_VCS_UNTRACKED_ICON='?'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status os_icon context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(background_jobs virtualenv rbenv time)

POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4

POWERLEVEL9K_TIME_FORMAT="%D{%H:%M \uE868  %d.%m.%y}"

POWERLEVEL9K_STATUS_VERBOSE=false

# POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
# POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
# POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
# POWERLEVEL9K_SHORTEN_STRATEGY="truncate_beginning"
# POWERLEVEL9K_TIME_BACKGROUND="black"
# POWERLEVEL9K_TIME_FOREGROUND="249"
# POWERLEVEL9K_TIME_FORMAT="\UF43A %D{%H:%M  \UF133  %m.%d.%y}"
# POWERLEVEL9K_STATUS_VERBOSE=false
# POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'
# POWERLEVEL9K_VCS_CLEAN_BACKGROUND='green'
# POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='black'
# POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
# POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='white'
# POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='black'
# POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
# POWERLEVEL9K_STATUS_VERBOSE=false
# POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
# POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
# POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
# POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
# POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'
# POWERLEVEL9K_VCS_COMMIT_ICON="\uf417"
# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{blue}\u256D\u2500%F{white}"
# POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="%F{blue}\u2570\uf460%F{white} "
# POWERLEVEL9K_CUSTOM_INTERNET_SIGNAL="zsh_internet_signal"
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context os_icon custom_internet_signal zsh_battery_level ssh root_indicator dir dir_writable vcs)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time  status  time)
# HIST_STAMPS="mm/dd/yyyy"
# DISABLE_UPDATE_PROMPT=true

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS=true

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(gitfast colorize colored-man-pages osx ruby rbenv gem vagrant ssh-agent tmux fast-syntax-highlighting zsh-completions zsh-autosuggestions extract docker docker-compose)
autoload -U compinit && compinit

# Color correct paths rather than underlining them.
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'

# Load SSH identities
zstyle :omz:plugins:ssh-agent identities id_rsa

# Add custom completion scripts
fpath=(~/.zsh/completion $fpath)

# Start oh-my-zsh and zplug
source $ZSH/oh-my-zsh.sh
source $ZPLUG_HOME/init.zsh

# PATH modifications. Don't modify if we're in TMUX because path_helper does it for us.
# I also modifed /etc/zprofile as shown here https://pgib.me/blog/2013/10/11/macosx-tmux-zsh-rbenv/
if [[ -z $TMUX ]]; then

  # Add ~/.bin to PATH
  export PATH="$PATH:$HOME/.bin"
  # Add homebrew's sbin dir to PATH
  export PATH="/usr/local/sbin:$PATH"

  # Initialize rbenv
  if which rbenv >/dev/null ; then
    [[ $PATH =~ 'rbenv/shims' ]] || eval "$(rbenv init -)"
  fi
fi

# Load plugin files
zplug 'supercrabtree/k'
zplug 'zdharma/fast-syntax-highlighting'

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

# Source my external alias config
# NOTE about 'ls': If coreutils is installed, oh-my-zsh will alias ls to gls, but
#                  something about it is broken which breaks ls. not sure...

source $HOME/.aliases
source $HOME/.functions
source $HOME/.exports
source $HOME/.inputrc

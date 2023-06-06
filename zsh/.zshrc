# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# export NVM_LAZY_LOAD=true
# export NVM_COMPLETION=false
# export NVM_LAZY_LOAD_EXTRA_COMMANDS=('nvim')

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="spaceship" 
#SPACESHIP_DOCKER_SHOW=false

#SPACESHIP_PROMPT_ORDER=(
#  time          # Time stampts section
#  user          # Username section
#  host          # Hostname section
#  dir           # Current directory section
#  git           # Git section (git_branch + git_status)
#  node          # Node.js section
#  venv          # virtualenv section
#  exec_time     # Execution time
#  line_sep      # Line break
#  battery       # Battery level and status
#  exit_code     # Exit code section
#  char          # Prompt character
#)
#

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  # zsh-nvm
  evalcache
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	autojump
	themes
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export PATH=$PATH:/home/oyvind/utils

export SPICETIFY_INSTALL="/home/oyvind/spicetify-cli"
export PATH="$SPICETIFY_INSTALL:$PATH"
export PATH="idea-IU-211.6693.111/bin:$PATH"

export PATH="$HOME/.pub-cache/bin:$PATH"
export PATH="$HOME/flutter/bin/cache/dart-sdk/bin:$PATH"
export PATH="$HOME/code/tools/flutter/bin:$PATH"

export PATH="$PATH:/usr/local/mysql/bin"

export PATH="$PATH:/home/oyvind/idea-IU-2020.6397.94/bin"
export PATH="$PATH:/home/oyvind/clion-2020.3/bin"

alias python=python3

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

#export PATH="/usr/local/sbin:$PATH"
#export M2_HOME="/Users/Oyvind/apache-maven-3.6.3"
#export PATH="${M2_HOME}/bin:$PATH"
export PATH=$HOME/.config/rofi/bin:$PATH

alias rvim='sudo -E nvim'
export PATH="/usr/local/sbin:$PATH"
export PATH="${M2_HOME}/bin:$PATH"
export GOPATH=$HOME/go
export PATH="${GOPATH}/:$PATH"

export EDITOR=nvim


# Aliases
alias nvskhd="nvim ~/.config/skhd/skhdrc"
alias nvy="nvim ~/.config/yabai/yabairc"
alias nvzh="nvim ~/.zshrc"
alias sc="source ~/.zshrc"
alias nvv="nvim ~/.config/nvim/init.vim"
alias lg="lazygit"


alias tmn="tmux new"
alias tmnn="tmux new -s"
alias tma="tmux a"

alias cat="bat"

eval "$(starship init zsh)"


alias k="kubectl"
source <(kubectl completion zsh)
export XDG_CONFIG_HOME="$HOME/.config"

# Neovim config switcher
#
export DEFAULT_NVIM_CONFIG="AstroNVIM"
alias nvim-astro='NVIM_APPNAME=AstroNvim nvim'

function nvims() {
  items=("default" "AstroNvim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

bindkey -s ^a "nvims\n"

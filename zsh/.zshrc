#zmodload zsh/zprof
# If you come from bash you might have to change your $PATH.
unset PATH
export PATH=/usr/local/go/bin:/usr/bin:/usr/local/bin:$HOME/.local/bin:$HOME/.emacs.d/bin:$HOME/.cargo/bin:$PATH
setopt histignorespace

# Path to your oh-my-zsh installation.
export ZSH="/home/sumanth0x637/.oh-my-zsh"
#PATH=$PATH:$HOME/.local/bin/
export EDITOR="/usr/bin/nvim"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export DOTFILES="$HOME/Documents/dotfiles/"

add_to_path () {
case ":$PATH:" in
  *":$new_entry:"*):;; # already there
  *) PATH="$new_entry:$PATH";; # or PATH="$PATH:$new_entry"
esac
}



# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
# zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
# zstyle ':completion:*' rehash true                              # automatically find new executables in path
# Speed up completions
# zstyle ':completion:*' accept-exact '*(N)'
# zstyle ':completion:*' use-cache on
# zstyle ':completion:*' cache-path ~/.zsh/cache
# HISTFILE=~/.zhistory
# HISTSIZE=10000
# SAVEHIST=10000
# export EDITOR=/usr/bin/nano
# export VISUAL=/usr/bin/nano
# WORDCHARS=${WORDCHARS//\/[&.;]}

# neofetch
# cmatrix -r
# asciiquarium
# /usr/local/bin/spark -> loc


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
 zstyle ':omz:update' frequency 5

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

source $ZSH/oh-my-zsh.sh

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
colorscript random #docs/gitclones
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

eval "$(starship init zsh)"
# eval "$(zoxide init zsh)"

# Example aliases
alias zshconfig="$EDITOR  ~/.zshrc"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"
alias jupyter_nb="jupyter notebook --no-browser"
alias bashconfig="$EDITOR ~/.bashrc"
alias fishconfig="$EDITOR ~/.config/fish/config.fish"
alias alacconfig="$EDITOR ~/.config/alacritty/alacritty.yml"
alias kittyconfig="$EDITOR ~/.config/kitty/kitty.conf"
alias ping="gping"
alias du="dust"
alias pbcopy="xsel -ib"
alias pbpaste="xsel -ob"
alias pbclear="xsel -cb"
alias cls="clear"
# alias update_soft="sudo dnf update -y && sudo dnf upgrade -y"
alias please="sudo"
alias save="source ~/.zshrc"
# alias autoremove="sudo dnf autoremove -y"
# alias clean="sudo dnf clean packages"
alias ccat="lolcat"
alias cd..="cd .."
# alias update_ship="curl -sS https://starship.rs/install.sh | sh"
alias e="dolphin"
alias ls="exa -la -F --icons -h --color=always --no-permissions -G"
alias diff_file="kitty +kitten diff"

# zprof

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

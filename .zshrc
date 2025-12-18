# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region
bindkey '^[[1;3C' forward-word      # Alt+Right
bindkey '^[[1;3D' backward-word     # Alt+Left

# History
HISTSIZE=1000000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt AUTO_CD

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Custom config
## Environment variables
EDITOR=nvim
export PATH="$HOME/sdk/flutter/bin:$HOME/go/bin:$PATH"
export PATH="$HOME/Android/Sdk/platform-tools:$PATH"
export PATH="$HOME/Android/Sdk/cmdline-tools/latest/bin:$PATH"
export PATH="/home/harvey/.config/composer/vendor/bin:$PATH"
export PATH="/home/harvey/.local/opt/go/bin:$PATH"
export PATH="/home/harvey/.local/bin/uv:$PATH"
export CHROME_EXECUTABLE=google-chrome-stable

# Ruby Configs
export PATH="/home/harvey/.local/share/gem/ruby/3.3.0/bin:$PATH"

# Go Path
export GOPATH="$HOME/go"
export PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"

## Alias
alias c='clear'
alias cf='clear && fastfetch'
alias hx='helix'
alias tmux='tmux -u'

alias ls='eza'
alias l='eza -l'
alias ll='eza -la'
alias la='eza -la'

alias du='dust'
alias cat='bat'
alias grep='rg'

# Starship prompt
eval "$(starship init zsh)"

# Shell integrations
eval "$(fzf --zsh)"

#Custom Aliases
alias py='python'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd../../../'
alias ssh-add='eval `ssh-agent` && ssh-add'

## Auto run scripts
# Colorscripts
fastfetch


# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

. "$HOME/.local/bin/env"

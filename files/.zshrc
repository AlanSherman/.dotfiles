# Source lib files
for config_file (~/.zsh/lib/*.zsh) source $config_file

# History settings
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

# Editor is vi like
bindkey -v

# Set editor as vim
export EDITOR="/usr/bin/vim"

# Load and run compinit
autoload -U compinit
compinit -i

# Add plugins
for plugins (~/.zsh/*.plugin.zsh); do 
    fpath=($plugins $fpath)
    source $plugins
done

# Add theme
source ~/.zsh/blinks.theme.zsh

# Add alias
source ~/.alias

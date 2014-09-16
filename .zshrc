# Source lib files
for config_file (~/.zsh/lib/*.zsh) source $config_file

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

dotfiles=$( dirname `readlink ~/.bashrc` )
$dotfiles/update.sh

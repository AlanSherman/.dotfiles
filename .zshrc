if [ ! -d $HOME/.antigen ]
then
  mkdir $HOME/.antigen
fi

ZSHA_BASE=$HOME/.antigen

if [ ! -d $ZSHA_BASE/antigen ]
then
  git clone https://github.com/zsh-users/antigen.git $ZSHA_BASE/antigen
fi

source $ZSHA_BASE/antigen/antigen.zsh

antigen-use oh-my-zsh
antigen-bundle command-not-found
antigen-bundle colored-man
antigen-bundle extract
antigen-bundle git
antigen-bundle ssh-agent
antigen-bundle sudo
antigen-bundle svn
antigen-bundle zsh-users/zsh-syntax-highlighting
antigen-bundle zsh-users/zsh-history-substring-search

antigen-theme blinks

antigen-apply

# Set editor as vim
export EDITOR="/usr/bin/vim"

# Load and run compinit
autoload -U compinit
compinit -i

# Add alias
source ~/.alias

dotfiles=$( dirname `readlink ~/.bashrc` )
$dotfiles/update.sh

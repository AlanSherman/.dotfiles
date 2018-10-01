
if [ ! -d ${HOME}/.zgen ]
then
  git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
fi

# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then

  zgen oh-my-zsh
  zgen oh-my-zsh plugins/aws
  zgen oh-my-zsh plugins/brew
  zgen oh-my-zsh plugins/colored-man-pages
  zgen oh-my-zsh plugins/colorize
  zgen oh-my-zsh plugins/encode64
  zgen oh-my-zsh plugins/extract
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/git-extras
  zgen oh-my-zsh plugins/helm
  zgen oh-my-zsh plugins/iterm2
  zgen oh-my-zsh plugins/jsontools
  zgen oh-my-zsh plugins/kops
  zgen oh-my-zsh plugins/kubectl
  zgen oh-my-zsh plugins/mvn
  zgen oh-my-zsh plugins/ssh-agent
  zgen oh-my-zsh plugins/sudo
  zgen oh-my-zsh plugins/svn
  zgen oh-my-zsh plugins/svn-fast-info


  zgen load AlanSherman/zsh-distroalias
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-history-substring-search

  zgen oh-my-zsh themes/blinks
  # zgen load AlanSherman/dotfiles

  # generate the init script from plugins above
  zgen save
fi

# Set editor as vim
export EDITOR="/usr/bin/vim"

export TERM=xterm-256color

# Load and run compinit
autoload -U compinit
compinit -i

# Add alias
source ~/.alias

# Fix PATH
export PATH="/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH"

chpwd_auto_ls () {
  ls -HG
}

add-zsh-hook chpwd chpwd_auto_ls

dotfiles=$( dirname `readlink ~/.bashrc` )
$dotfiles/update.sh

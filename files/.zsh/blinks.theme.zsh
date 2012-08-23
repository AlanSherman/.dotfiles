# https://github.com/blinks zsh theme

function _prompt_char() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    echo "%{%F{blue}%}±%{%f%k%b%}"
  else
    echo ' '
  fi
}

ZSH_THEME_GIT_PROMPT_PREFIX="[%{%B%F{blue}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%k%b%K{black}%B%F{green}%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{red}%}*%{%f%k%b%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

function user_color() {
if ((${USER} == root)); then
    echo "%B%F{red}%}%n%{%B%F{blue}%}@%{%B%F{cyan}%}%m%{%B%F{green}%}"
else
    echo "%B%F{green}%}%n%{%B%F{blue}%}@%{%B%F{cyan}%}%m%{%B%F{green}%}"
fi
}
ZSH_PROMPT_PWD="%{%b%F{yellow}%K{black}%}%~%{%B%F{green}%}"

PROMPT='%{%f%k%b%}
%{%K{black}$(user_color) ${ZSH_PROMPT_PWD} $(git_prompt_info)%E%{%f%k%b%}
%{%K{black}%}$(_prompt_char)%{%K{black}%} %#%{%f%k%b%} '

RPROMPT=%B%F{white}%t%{%f%k%b%}

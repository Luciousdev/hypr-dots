#!/usr/bin/env zsh

# Colors
green="#99ffab"
magenta="#ff77ba"
orange="#f16301"

# Will generate random colors, every zsh session
local rd="%B%F{$((RANDOM % 100))}"
# Prompt indicator
local indicator="λ"
# Git dir indicator
local git=""
# HOME dir indicator
local home=""

torva() {
  get_cps_num_lock() {
    caps=$(xset q | grep Caps | cut -d ':' -f3 | awk '{print $1}')
    num=$(xset q | grep Caps | cut -d ':' -f5 | awk '{print $1}')

    if [[ $caps == on ]]; then
      echo -e "%F{$green} %fCapsLock \c "
    fi

    if [[ $num == on ]]; then
      echo -e "%F{$green} %fNumLock \c "
    fi
  }

  torva_git() {
    if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
      branch=$(git rev-parse --abbrev-ref HEAD)
      echo "%F$git %F{$orange}$branch"
    fi
  }

  torva_prompt() {
    echo "${rd}$indicator%f"
  }

  torva_rprompt() {
    local dir=""
    if [[ $PWD == $HOME ]]; then
      dir="%F{$green}$home%f"
    else
      dir="%F{$green}%(5~|%2|%4~)%f"
    fi

    echo "[%F{$green}%F{black}$dir%f] $(torva_git)"
  }


  PS1='$(torva_prompt) '
  RPS1='$(torva_rprompt)'
}

torva

precmd() {
  if [[ $PWD == $HOME ]]; then
    PS1="%F{$green}$home%f %F{$green}$indicator%f "
  else
    PS1="%F{$green}%4$home%f %F{$green}$indicator%f "
  fi
}


# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt auto_cd
setopt auto_name_dirs
setopt auto_pushd
setopt auto_remove_slash
setopt cdable_vars
setopt extended_history
setopt histignorealldups
setopt prompt_subst
setopt pushd_ignore_dups
setopt pushd_to_home

unsetopt chase_dots
unsetopt chase_links
unsetopt share_history

autoload -U colors
colors

function git-current-branch {
  local name st color

  if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
    return
  fi
  name=$(basename "`git symbolic-ref HEAD 2> /dev/null`")
  if [[ -z $name ]]; then
    return
  fi
  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    color=${fg[green]}
  elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
    color=${fg[yellow]}
  elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
    color=${fg_bold[red]}
  else
    color=${fg[red]}
  fi

  echo "%{$color%}$name%{$reset_color%} "
}

RPROMPT='[`git-current-branch`%~]'

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e
bindkey "^?" backward-delete-char
bindkey "^H" backward-delete-char
bindkey "^[[3~" delete-char
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

# Keep 10000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# alias
if [ -e /usr/local/bin/screen ]; then
  alias screen=/usr/local/bin/screen -U
fi

# variables
export EDITOR=vim
export LANGUAGE=ja_JP:ja
export LANG=ja_JP.UTF-8
export LC_MESSAGES=jp_JP.UTF-8
export LC_IDENTIFICATION=jp_JP.UTF-8
export LC_COLLATE=ja_JP.UTF-8
export LC_MEASUREMENT=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8
export LC_TIME=ja_JP.UTF-8
export LC_NAME=ja_JP.UTF-8
export VIRTUALENV_USE_DISTRIBUTE=true

if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
  export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
  export WORKON_HOME=$HOME/.VIRTUALENVS
  source /usr/local/bin/virtualenvwrapper.sh
fi


autoload -U compinit; compinit        #コマンド補完をONに
autoload -U colors; colors
autoload -Uz promptinit; promptinit
prompt adam1

# zstyle
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

# setopt
setopt auto_cd
setopt auto_pushd
setopt auto_remove_slash
setopt cdable_vars
setopt correct              #スペル訂正
setopt extended_glob
setopt extended_history
setopt histignorealldups
setopt prompt_subst
setopt prompt_subst
setopt pushd_ignore_dups
setopt pushd_to_home
setopt share_history        #履歴を複数端末で共有する

# unset opt
unsetopt chase_dots
unsetopt chase_links
unsetopt share_history

# history
HISTFILE=~/.zsh_history     #履歴ファイルの指定
HISTSIZE=10000              #履歴サイズの指定
SAVEHIST=10000              #履歴サイズの指定

# keybind
bindkey -e
bindkey "^?"    backward-delete-char
bindkey "^H"    backward-delete-char
bindkey "^[[3~" delete-char
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

# comp
_cache_hosts=(`cut -d' ' -f1 ~/.ssh/known_hosts | cut -d, -f1`)
compctl -k _cache_hosts yssh ssh sssh
compctl -S ':' -k _cache_hosts + -f yscp scp

# prompt
function git-current-branch {
  local name st color

  if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
    return
  fi
  name=$(git symbolic-ref HEAD 2> /dev/null | cut -d'/' -f3-)
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

  # %{...%} は囲まれた文字列がエスケープシーケンスであることを明示する
  # これをしないと右プロンプトの位置がずれる
  echo "%{$color%}$name%{$reset_color%} "
}

precmd() {
  PROMPT="[%n@%m]%% ";
  RPROMPT="[`git-current-branch`%~]";
}

# alias
case "${OSTYPE}" in
darwin*) # for Mac OS X
  alias ls='ls -G'
  alias ll='ls -Gl'
  alias la='ls -Gla'
  ;;
linux*)
  alias ls='ls --color'
  alias ll='ls --color -l'
  alias la='ls --color -la'
  ;;
esac

# 垂直分割可能なscreenを使用する
if [ -e /usr/local/bin/screen ]
then
  alias screen=/usr/local/bin/screen -U
fi

# start ssh agent
echo -n "ssh-agent: "
if [ -e ~/.ssh-agent-info ]
then
  source ~/.ssh-agent-info
fi

ssh-add -l >& /dev/null
if [ $? = 2 ]
then
  echo -n "ssh-agent: restart...."
  ssh-agent >~/.ssh-agent-info
  source ~/.ssh-agent-info
fi

if ssh-add -l >& /dev/null
then
  echo "ssh-agent: Identity is already stored."
else
  ssh-add
fi

autoload -U compinit; compinit        #コマンド補完をONに
autoload -U colors; colors

# setopt
setopt auto_cd
setopt correct              #スペル訂正
setopt share_history        #履歴を複数端末で共有する
setopt extended_history
setopt extended_glob
setopt prompt_subst

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
compctl -k _cache_hosts ssh sssh
compctl -S ':' -k _cache_hosts + -f scp

# zsh-syntax-highlighting
if [ -f .zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source .zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

source ~/.zshfunc

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

# virtualenvwrapper
if [ -z $VIRTUAL_ENV -a -f /usr/local/bin/virtualenvwrapper.sh ]; then
  source /usr/local/bin/virtualenvwrapper.sh
fi

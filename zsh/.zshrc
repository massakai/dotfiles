autoload -U compinit; compinit  #コマンド補完をONに
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
if [ -e ~/.ssh/known_hosts ]; then
    _cache_hosts=(`cut -d' ' -f1 ~/.ssh/known_hosts | cut -d, -f1`)
    compctl -k _cache_hosts ssh sssh
    compctl -S ':' -k _cache_hosts + -f scp
fi

source ${ZDOTDIR}/.zshrc.ssh
source ${ZDOTDIR}/functions
source ${ZDOTDIR}/zshrc.alias

# zsh-syntax-highlighting
if [ -f ${ZDOTDIR}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source ${ZDOTDIR}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# virtualenvwrapper
if [ -z $VIRTUAL_ENV -a -f /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

# OS固有の設定
case "${OSTYPE}" in
darwin*) # for Mac OS X
    source darwin/.zshrc
    ;;
linux*)
    source linux/.zshrc
    ;;
esac

autoload -U compinit; compinit  #コマンド補完をONに
autoload -U colors; colors

# setopt
setopt auto_cd
setopt correct              # スペル訂正
setopt share_history        # 履歴を複数端末で共有する
setopt hist_ignore_dups     # 重複を記録しない
setopt hist_ignore_all_dups # ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_space    # スペースで始まるコマンド行はヒストリリストから削除
setopt hist_reduce_blanks   # 余分な空白は詰めて記録
setopt hist_no_store        # historyコマンドは履歴に登録しない
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

# load ZDOTDIR
if [ -n "${ZDOTDIR}" -a -e ~/.zshenv ]; then
    source ~/.zshenv
fi
ZDOTDIR=${ZDOTDIR:-${HOME}}

source ${ZDOTDIR}/.zshrc.ssh
source ${ZDOTDIR}/functions
source ${ZDOTDIR}/.zshrc.alias

# zsh-syntax-highlighting
if [ -f ${ZDOTDIR}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source ${ZDOTDIR}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# OS固有の設定
case "${OSTYPE}" in
darwin*) # for Mac OS X
    source ${ZDOTDIR}/darwin/.zshrc
    ;;
linux*)
    source ${ZDOTDIR}/linux/.zshrc
    ;;
esac

# env variables
export EDITOR=vim
export LANG=ja_JP.UTF-8     #文字コードの設定
export LANGUAGE=ja_JP:ja
export LC_ALL=ja_JP.UTF-8
export LC_COLLATE=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8
export LC_IDENTIFICATION=jp_JP.UTF-8
export LC_MEASUREMENT=ja_JP.UTF-8
export LC_MESSAGES=jp_JP.UTF-8
export LC_NAME=ja_JP.UTF-8
export LC_TIME=ja_JP.UTF-8
export SHELL=/bin/zsh

# path
typeset -T LIBRARY_PATH               library_path
typeset -T LD_LIBRARY_PATH            ld_library_path
typeset -T C_INCLUDE_PATH             c_include_path
typeset -T CPLUS_INCLUDE_PATH         cplus_include_path
typeset -T DYLD_FALLBACK_LIBRARY_PATH dyld_fallback_library_path
typeset -T BOOST_ROOT                 boost_root
typeset -U path manpath library_path ld_library_path c_include_path cplus_include_path dyld_fallback_library_path boost_root

if [ -n ${ZDOTDIR} ]; then
    DOTDIR=${ZDOTDIR%/*}
    DOTBIN=${DOTDIR}/bin
fi

path=(
    $path
    /usr/*/bin(N-/)
    /usr/local/*/bin(N-/)
    /var/*/bin(N-/)
    ${DOTBIN}
)

# DropBox
export DROPBOX_HOME=~/Dropbox

# options
export GREP_OPTIONS="--color=always"
export LESS="-R"
# enviroment specific settings
case "${OSTYPE}" in
darwin*) # for Mac OS X
  export XARGS_EMPTY_OPTION=''
  ;;
linux*)
  export XARGS_EMPTY_OPTION='--no-run-if-empty'
  ;;
esac

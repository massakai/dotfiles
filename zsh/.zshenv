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

if [ -n ${ZDOTDIR} ]; then
    DOTDIR=${ZDOTDIR%/*}
    DOTBIN=${DOTDIR}/bin
fi

path=(
    $path
    ${DOTBIN}
)

# DropBox
export DROPBOX_HOME=~/Dropbox

# Python
export PIP_CONFIG_FILE=~/.config/pip/pip.conf
export PYTHON36_HOME="/Library/Frameworks/Python.framework/Versions/3.6"
path=(
    ${PYTHON36_HOME}/bin
    $path
)

# Google Cloud Platform
export GCP_HOME=/Applications/google-cloud-sdk
path=(
    ${GCP_HOME}/bin
    $path
)

# options
export GREP_OPTIONS="--color=always"
export LESS="-R"
# enviroment specific settings
case "${OSTYPE}" in
darwin*) # for Mac OS X
  export XARGS_EMPTY_OPTION=''
  export JAVA_HOME_CMD=/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home
  # Java 11をデフォルトにする
  export JAVA_HOME=$(${JAVA_HOME_CMD} -v 11)
  ;;
linux*)
  export XARGS_EMPTY_OPTION='--no-run-if-empty'
  ;;
esac

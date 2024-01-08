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

typeset -U path

path=(
    $path
    ${DOTBIN}
)

# DropBox
export DROPBOX_HOME=~/Dropbox

# Python
export PIP_CONFIG_FILE=~/.config/pip/pip.conf
export PYTHON310_HOME="/Library/Frameworks/Python.framework/Versions/3.10"
export PYTHON311_HOME="/Library/Frameworks/Python.framework/Versions/3.11"
export PYTHON312_HOME="/Library/Frameworks/Python.framework/Versions/3.12"
path=(
    ${PYTHON312_HOME}/bin
    $path
)

# Scala
export COURSIER_HOME="/Users/massakai/Library/Application Support/Coursier"
path=(
  ${COURSIER_HOME}/bin
  $path
)

# Google Cloud Platform
export GCP_HOME=/Applications/google-cloud-sdk
path=(
    ${GCP_HOME}/bin
    $path
)

# PostgreSQL
export POSTGRESQL_HOME=/usr/local/Cellar/postgresql@16/16.1_1
path=(
    ${POSTGRESQL_HOME}/bin
    $path
)

# options
export GREP_OPTIONS="--color=always"
export LESS="-R"
# enviroment specific settings
case "${OSTYPE}" in
darwin*) # for Mac OS X
  export XARGS_EMPTY_OPTION=''
  export JAVA_HOME_CMD=/usr/libexec/java_home
  # Java 17をデフォルトにする
  export JAVA_HOME=$(${JAVA_HOME_CMD} -v 17)
  ;;
linux*)
  export XARGS_EMPTY_OPTION='--no-run-if-empty'
  ;;
esac

#!/bin/bash -eu

DATE=`date +\%Y-\%m-\%d`
LOG_DIR=~/.crontab/logs/brew
BREW=/usr/local/bin/brew
BREW_LOG=${LOG_DIR}/$DATE.out
BREW_ERR=${LOG_DIR}/$DATE.err

if [ ! -e ${BREW} ]
then
    echo "Homebrewがインストールされていません。" >> ${BREW_ERR}
    # インストールしない環境もあるので、エラーにはしない。
    exit 0
fi

mkdir -p ${LOG_DIR}
${BREW} update >> ${BREW_LOG} 2>> ${BREW_ERR}
${BREW} upgrade >> ${BREW_LOG} 2>> ${BREW_ERR}

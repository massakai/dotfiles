#!/bin/bash -eu

DATE=`date +\%Y-\%m-\%d`
LOG_DIR=~/.crontab/logs/brew
BREW_LOG=${LOG_DIR}/$DATE.out
BREW_ERR=${LOG_DIR}/$DATE.err

mkdir -p ${LOG_DIR}
brew update >> ${BREW_LOG} 2>> ${BREW_ERR}
brew upgrade >> ${BREW_LOG} 2>> ${BREW_ERR}

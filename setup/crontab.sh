#!/bin/zsh

ln -sf ${REPOSITORY_ROOT_DIR}/.crontab ~/.crontab
crontab <(${REPOSITORY_ROOT_DIR}/crontab.sh)

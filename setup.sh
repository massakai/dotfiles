#!/bin/sh

REPOSITORY_ROOT_DIR=$(cd $(dirname $0) && pwd)

# zsh
echo "change shell (zsh)"
sudo chsh -s /bin/zsh $USER

# screen setup
mkdir -p ~/.screen

# vimgdb setup

# create symbolic links
echo $0
echo ${REPOSITORY_ROOT_DIR}
for PATH in $(find ${REPOSITORY_ROOT_DIR} -name ".*" -type f | grep -v '\.git$')
do
  case "${OSTYPE}" in
  darwin*)
    FILENAME=$(/usr/bin/basename ${PATH})
    ;;
  linux*)
    FILENAME=$(/bin/basename ${PATH})
    ;;
  esac
  /bin/rm -f ~/${FILENAME}
  /bin/ln -s ${PATH} ~/${FILENAME}
done

mkdir -p ~/.ssh
/bin/rm -f ~/.ssh/config
/bin/ln -s ${REPOSITORY_ROOT_DIR}/.ssh/config ~/.ssh/config

# cron
crontab ${REPOSITORY_ROOT_DIR}/crontab

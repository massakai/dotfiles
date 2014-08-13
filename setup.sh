#!/bin/sh

REPOSITORY_ROOT_DIR=$(cd $(dirname $0) && pwd)

# zsh
echo "change shell (zsh)"
sudo chsh -s /bin/zsh $USER

# screen setup
mkdir -p ~/.screen

# create symbolic links
echo $0
echo ${REPOSITORY_ROOT_DIR}
for dotfile in $(find ${REPOSITORY_ROOT_DIR} -name ".*" -type f | grep -v '\.git$')
do
  FILENAME=$(basename ${dotfile})
  rm -f ~/${FILENAME}
  ln -s ${dotfile} ~/${FILENAME}
done

mkdir -p ~/.ssh
rm -f ~/.ssh/config
ln -s ${REPOSITORY_ROOT_DIR}/.ssh/config ~/.ssh/config
ln -s ${REPOSITORY_ROOT_DIR}/.vim        ~/.vim

# cron
crontab ${REPOSITORY_ROOT_DIR}/crontab

#!/bin/zsh

REPOSITORY_ROOT_DIR=$(cd $(dirname $0) && pwd)
DROPBOX_HOME=~/Dropbox

function info
{
    echo "\e[32;1m$@\e[m" 1>&2
}

# load submodule
git submodule init
git submodule update

source setup/zsh.sh
source setup/screen.sh
source setup/ssh.sh
source setup/vim.sh
source setup/crontab.sh
source setup/pypi.sh

# OS specific setup
if [ -f /etc/ec2_version ]; then
  OS=$(cat /etc/ec2_version | awk '{ print $1 }')
  case $OS in
    Ubuntu) source setup/ubuntu.sh ;;
  esac
fi

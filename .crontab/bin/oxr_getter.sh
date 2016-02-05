#!/bin/zsh

# settings
APP_ENV=~/.venvs/pyoxr
APP_HOME=~/git/pyoxr
APP_ID=`cat ~/Dropboxy/Backup/oxr.app_id`
LOG=~/Dropbox/Backup/oxr.log

source $APP_ENV/bin/activate
python3.5 $APP_HOME/oxr_getter.py >> $LOG

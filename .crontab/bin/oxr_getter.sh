#!/bin/zsh

# settings
APP_ENV=~/.venvs/pyoxr
APP_HOME=~/git/pyoxr
APP_ID=`cat ~/Amazon\ Drive/Dropbox/Backup/oxr.app_id`
LOG=~/Amazon\ Drive/Dropbox/Backup/oxr.out

source $APP_ENV/bin/activate
python3.5 $APP_HOME/oxr_getter.py >> $LOG

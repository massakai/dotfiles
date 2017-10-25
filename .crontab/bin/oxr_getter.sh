#!/bin/bash -eu

DATE=`date "+%Y-%m-%d %H:%M:%S"`

# settings
APP_ENV=~/.venvs/pyoxr
APP_HOME=~/github/pyoxr
APP_ID_PATH=~/Dropbox/Backup/oxr.app_id
LOG=~/Dropbox/Backup/oxr.out

if [[  ! -d ${APP_ENV} ]]
then
    echo "${APP_ENV}が存在しません。" >> ${LOG}
    exit 1
elif [[ ! -d ${APP_HOME} ]]
then
    echo "${APP_HOME}が存在しません。" >> ${LOG}
    exit 1
elif [[ ! -d ${APP_ID_PATH} ]]
then
    echo "${APP_ID_PATH}が存在しません。" >> ${LOG}
    exit 1
fi

APP_ID=`cat ${APP_ID_PATH}`
source $APP_ENV/bin/activate
echo "[${DATE}] start oxr_getter.py" >> ${LOG}
python3.5 $APP_HOME/oxr_getter.py >> $LOG

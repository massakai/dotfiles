#!/bin/bash

DATE=`date +\%Y-\%m-\%d`
DOCKER=/usr/local/bin/docker
LOG_DIR=~/.crontab/logs/docker_cleaner
LOG_OUT=${LOG_DIR}/$DATE.out
LOG_ERR=${LOG_DIR}/$DATE.err

if [ ! -e ${DOCKER} ]
then
    echo "Dockerがインストールされていません。" >> ${LOG_ERR}
    # インストールしない環境もあるので、エラーにはしない。
    exit 0
fi

if ! pgrep com.docker.backend > /dev/null
then
    echo "Dockerデーモンが起動していません。" >> ${LOG_ERR}
    # 使わない時は起動していないので、エラーにはしない。
    exit 0
fi

${DOCKER} image prune -f >> ${LOG_OUT} 2>> ${LOG_ERR}


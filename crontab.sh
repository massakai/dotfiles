#!/bin/sh

cat <<EOS
SHELL=${SHELL}
HOME=${HOME}
MAILTO=masashi.sakai1986@gmail.com
PATH=${HOME}/.crontab/bin:/usr/local/bin:/usr/bin:/bin
LOG_DIR=${HOME}/.crontab/logs

EOS

cat <<'EOS'
#
# hourly
#

# log open exchange rate
10 * * * * oxr_getter.sh < /dev/null > ${LOG_DIR}/oxr_getter.out 2> ${LOG_DIR}/oxr_getter.err

#
# daily
#

# brew update & upgrade
0 3 * * * brew.sh

# remove old log files
0 0 * * * find ${LOG_DIR} -name '*.out' -o -name '*.err' -mtime +30 | xargs ${XARGS_EMPTY_OPTION} rm
EOS

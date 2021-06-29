#/bin/bash

# -----------------------------------------------------------------------------------------

logger Backups starting...

# -----------------------------------------------------------------------------------------

LOG_FILE=/var/log/backup_redhat-workstation.log

# -----------------------------------------------------------------------------------------

rm -rf ${LOG_FILE}

# -----------------------------------------------------------------------------------------

echo
echo "Start Date:           `date +'%F %a'`"

# -----------------------------------------------------------------------------------------

mkdir -p /exports/backups/remote/host/redhat-workstation/

echo "    redhat-workstation -> server-ap:"
echo "        /etc:                        `date +'%H:%M:%S'`"
rsync -av $1 redhat-workstation:/etc /exports/backups/remote/host/redhat-workstation/ --log-file=${LOG_FILE} $* &> /dev/null

echo "        /home:                       `date +'%H:%M:%S'`"
rsync -av $1 redhat-workstation:/home /exports/backups/local/host/redhat-workstation/ --log-file=${LOG_FILE} $* &> /dev/null

# -----------------------------------------------------------------------------------------

echo "End Date:             `date +'%F %a %H:%M:%S'`"

logger Backups complete...

# -----------------------------------------------------------------------------------------

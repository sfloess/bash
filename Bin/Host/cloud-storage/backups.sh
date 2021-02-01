#/bin/bash

# -----------------------------------------------------------------------------------------

logger Backups starting...

# -----------------------------------------------------------------------------------------

LOG_FILE=/var/log/backups.log

# -----------------------------------------------------------------------------------------

rm -rf ${LOG_FILE}

# -----------------------------------------------------------------------------------------

echo
echo "Start Date:      `date +'%F %a'`"

# -----------------------------------------------------------------------------------------

echo "    cloud-storage:"

mkdir -p /exports/nas/backups/host/cloud-storage/

echo "        /etc:                   `date +'%H:%M:%S'`"

rsync -av $1 /etc /exports/nas/backups/host/cloud-storage/ --log-file=${LOG_FILE} $* &> /dev/null

mkdir -p /exports/nas/backups/host/cloud-storage/exports

echo "        /exports/home:          `date +'%H:%M:%S'`"

rsync -av $1 /exports/home /exports/nas/backups/host/cloud-storage/exports --log-file=${LOG_FILE} $* &> /dev/null

# -----------------------------------------------------------------------------------------

echo "End Date:        `date +'%F %a'` `date +'%H:%M:%S'`"

logger Backups complete...

# -----------------------------------------------------------------------------------------
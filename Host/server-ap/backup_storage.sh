#/bin/bash

# -----------------------------------------------------------------------------------------

logger Backups starting...

# -----------------------------------------------------------------------------------------

LOG_FILE=/var/log/backup_storage.log

# -----------------------------------------------------------------------------------------

rm -rf ${LOG_FILE}

# -----------------------------------------------------------------------------------------

echo
echo "Start Date:      `date +'%F %a'`"

# -----------------------------------------------------------------------------------------

echo "    storage -> server-ap:"

mkdir -p /exports/backups/remote/host/cloud-storage/

echo "        /etc:                   `date +'%H:%M:%S'`"

rsync -av $1 storage:/etc /exports/backups/remote/host/cloud-storage/ --log-file=${LOG_FILE} $* &> /dev/null

mkdir -p /exports/backups/remote/host/cloud-storage/exports

echo "        /exports/home:          `date +'%H:%M:%S'`"

rsync -av $1 storage:/exports/home /exports/backups/remote/host/cloud-storage/exports --log-file=${LOG_FILE} $* &> /dev/null

# -----------------------------------------------------------------------------------------

echo "End Date:        `date +'%F %a'` `date +'%H:%M:%S'`"

logger Backups complete...

# -----------------------------------------------------------------------------------------


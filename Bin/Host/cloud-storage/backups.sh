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

echo "    family-ap:"

mkdir -p /mnt/family-ap/exports/backups/host/cloud-storage/exports

echo "        /etc:                   `date +'%H:%M:%S'`"

rsync -av $1 /etc /mnt/family-ap/exports/backups/host/cloud-storage/ --log-file=${LOG_FILE} $* &> /dev/null

echo "        /exports:               `date +'%H:%M:%S'`"

rsync -av $1 /exports /mnt/family-ap/exports/backups/host/cloud-storage/ --log-file=${LOG_FILE} $* &> /dev/null

# -----------------------------------------------------------------------------------------

echo "    cloud-server:"

mkdir -p /mnt/cloud-server/exports/backups/host/cloud-storage/exports

echo "        /etc:                   `date +'%H:%M:%S'`"

rsync -av $1 /etc /mnt/cloud-server/exports/backups/host/cloud-storage/ --log-file=${LOG_FILE} $* &> /dev/null

echo "        /exports:               `date +'%H:%M:%S'`"

rsync -av $1 /exports /mnt/cloud-server/exports/backups/host/cloud-storage/ --log-file=${LOG_FILE} $* &> /dev/null

# -----------------------------------------------------------------------------------------

echo "End Date:        `date +'%F %a'` `date +'%H:%M:%S'`"

logger Backups complete...

# -----------------------------------------------------------------------------------------
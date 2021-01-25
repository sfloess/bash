#/bin/bash

# -----------------------------------------------------------------------------------------

logger Backups starting...

# -----------------------------------------------------------------------------------------

LOG_FILE=/var/log/backups.log

# -----------------------------------------------------------------------------------------

rm -rf ${LOG_FILE}

# -----------------------------------------------------------------------------------------

echo
echo "Start Date:           `date +'%F %a'`"

# -----------------------------------------------------------------------------------------

mkdir -p /mnt/cloud-storage/exports/backups/host/redhat-workstation/

echo "    cloud-storage:"
echo "        /etc:                       `date +'%H:%M:%S'`"
rsync -av $1 /etc /mnt/cloud-storage/exports/backups/host/redhat-workstation/ --log-file=${LOG_FILE} $* &> /dev/null

echo "        /home:                      `date +'%H:%M:%S'`"
rsync -av $1 /home /mnt/cloud-storage/exports/backups/host/redhat-workstation/ --log-file=${LOG_FILE} $* &> /dev/null

# -----------------------------------------------------------------------------------------

echo "End Date:             `date +'%F %a %H:%M:%S'`"

logger Backups complete...

# -----------------------------------------------------------------------------------------

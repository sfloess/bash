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

mkdir -p /mnt/cloud-ap/exports/backups/remote/host/redhat-workstation/

echo "    redhat-workstation -> cloud-ap:"
echo "        /etc:                        `date +'%H:%M:%S'`"
rsync -av $1 /etc /mnt/cloud-ap/exports/backups/remote/host/redhat-workstation/ --log-file=${LOG_FILE} $* &> /dev/null

#mkdir -p /mnt/desktop-ap/exports/backups/local/host/redhat-workstation/

echo "        /home:                       `date +'%H:%M:%S'`"
#rsync -av $1 /home /mnt/cloud-ap/exports/backups/local/host/redhat-workstation/ --log-file=${LOG_FILE} $* &> /dev/null
rsync -av $1 /home /mnt/cloud-ap/exports/backups/local/host/redhat-workstation/ --log-file=${LOG_FILE} $* &> /dev/null

# -----------------------------------------------------------------------------------------

echo "End Date:             `date +'%F %a %H:%M:%S'`"

logger Backups complete...

# -----------------------------------------------------------------------------------------
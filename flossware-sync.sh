#!/bin/bash

#rsync -av --delete --exclude .git `dirname ${BASH_SOURCE[0]}`/* bedroom-ap:/opt/exports/FlossWare/public/

mkdir -p /opt/exports/FlossWare/public
rsync -av --delete --exclude .git `dirname ${BASH_SOURCE[0]}`/* /opt/exports/FlossWare/public/

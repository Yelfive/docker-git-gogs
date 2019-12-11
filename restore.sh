#!/bin/bash

if [ $# -ne 1 ]; then
    cat <<USAGE
Usage: $0 data/backup.zip
    Restore backup
USAGE
    exit 1
fi

if [ ! -f "${PWD}/$1" ]; then
    echo Please place backup zip in the directory '${PWD}'/data >&2
    exit 1
fi

if ! test -f data/tmp; then
    mkdir data/tmp;
fi

docker-compose exec -e USER=git git /app/gogs/gogs restore --from "/$1" -t /data/tmp/

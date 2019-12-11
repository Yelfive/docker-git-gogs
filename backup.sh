#!/bin/bash

docker-compose exec -e USER=git git /app/gogs/gogs backup

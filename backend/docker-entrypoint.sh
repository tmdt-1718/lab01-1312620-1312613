#!/bin/bash
set -e

if [ "$1" = 'new' ]; then
    exec rails "$@"
fi

exec "$@"
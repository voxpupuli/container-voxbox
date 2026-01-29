#!/bin/ash

export DEVUID=$(stat -c '%u' /repo/)
export DEVGID=$(stat -c '%g' /repo/)
export DEVUSER=voxbox$DEVUID
export DEVGROUP=voxbox$DEVGID

addgroup -S -g $DEVGID $DEVGROUP &>/dev/null
adduser -S -u $DEVUID -G $DEVGROUP $DEVUSER  &>/dev/null

exec runuser -u $DEVUSER -g $DEVGROUP -- "$@"

#!/bin/bash -e

openlog () {
    [ ${KEEP_LOG} ] && exec &>> {$KEEP_LOG}
}

trap "kill -TERM -- -$$" EXIT
trap openlog HUP

openlog

while true; do
    $@ && exit 0 || sleep 0.1
done

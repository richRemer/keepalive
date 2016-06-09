#!/bin/bash -e
# Usage: keepalive <user> <log> <cmd> [<cmdopts>]

user="$1"
logfile="$2"
shift 2 || (echo invalid arguments >&2 && exit 1)

openlog () {
    exec 1>> "$logfile" 2>&1
}

pgid () {
    pid=$$
    echo $(ps -o pgid= $pid | grep -o [0-9]*)
}

terminate () {
    kill -TERM -- -`pgid`
}

trap terminate EXIT
trap openlog HUP
openlog

while true; do
    sudo -u$user $@ || true
    sleep 0.1
done

#!/bin/bash -e

while [[ "$1" == --* ]]; do
    case "$1" in
        --logfile)
            logfile="$2"
            shift;;
        --user)
            user="$2"
            shift;;
        *)
            echo "unrecognized option: $1";;
    esac
    shift
done

openlog () {
    [ "$logfile" ] && exec &>> "$logfile"
}

logfile=${logfile:-$KEEP_LOG}

trap "kill -TERM -- -$$" EXIT
[ "$logfile" ] && openlog && trap openlog HUP

while true; do
    if [ $user ]; then
        sudo -u$user $@ && exit 0 || sleep 0.1
    else
        $@ && exit 0 || sleep 0.1
    fi
done

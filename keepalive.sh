#!/bin/bash -e

# check for --logfile option
if [ "$1" == "--logfile" ]; then
    logfile="$2"
    shift 2
# or fallback to $KEEP_LOG environment
else
    logfile=${KEEP_LOG}
fi

openlog () {
    [ "$logfile" ] && exec &>> "$logfile"
}

trap "kill -TERM -- -$$" EXIT
[ "$logfile" ] && openlog && trap openlog HUP

while true; do
    $@ && exit 0 || sleep 0.1
done

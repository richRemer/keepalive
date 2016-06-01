#!/bin/bash -e

trap "kill -TERM -- -$$" EXIT

while true; do
    $@ && exit 0 || sleep 1
done

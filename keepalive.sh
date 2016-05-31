#!/bin/bash -e

while true; do
    $@ && exit 0 || sleep 1
done

#!/bin/bash

commands=(
#    'ulimit -n 999999;ulimit -u999999; zmap -p 80 -T4  | go run massloader.go 81'
#    'ulimit -n 999999;ulimit -u999999; zmap -p 80 -T4  | go run massloader.go 8081'
    "ulimit -n 999999;ulimit -u999999; zmap -p 5555 -o- -q -v0 -T3 | awk {'print $1\":5555\"'} | ./android"
    'bash scan.sh'
)

for cmd in "${commands[@]}"; do
    echo "Running command: $cmd"
    eval "$cmd"
    echo "Command finished"
done

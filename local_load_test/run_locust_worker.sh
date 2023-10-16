#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 <number_of_workers> <filename>"
  exit 1
fi

number_of_workers=$1
filename=$2

for i in $(seq 1 $number_of_workers); do
  locust -f "$filename" --worker > "output.log" 2>&1 &
  sleep 1
done
#!/bin/bash

# Disk usage monitor
THRESHOLD=80
USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')

echo "Current disk usage is: $USAGE%"

if [ "$USAGE" -gt "$THRESHOLD" ]; then
  echo "⚠️ Warning: Disk usage is above ${THRESHOLD}%!"
  exit 1
else
  echo "✅ Disk usage is under control."
  exit 0
fi


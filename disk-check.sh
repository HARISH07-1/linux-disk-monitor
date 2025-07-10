#!/bin/bash

# Disk usage monitor
THRESHOLD=80
USAGE=$(df . | awk 'NR==2 {print $5}' | sed 's/%//')

echo "Current disk usage is: ${USAGE}%"

if [ "$USAGE" -gt "$THRESHOLD" ]; then
  echo "⚠️ Warning: Disk usage is above ${THRESHOLD}%!"
  exit 1
else
  echo "✅ Disk usage is under control."
  exit 0
fi


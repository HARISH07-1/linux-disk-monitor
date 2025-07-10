# 💽 Linux Disk Usage Monitor with Jenkins CI/CD

This project monitors disk usage and alerts when usage exceeds 80%, automated through a CI/CD pipeline using Jenkins and GitHub.

---

## 🚀 Tools Used

- Git & GitHub  
- Jenkins  
- Shell Scripting  
- Git Bash (Windows)  
- SSH Key Authentication

---

## ⚙️ How It Works

1. Developer writes a script: `disk-check.sh`  
2. Script checks current disk usage (via `df .`)  
3. If usage > 80%, prints a warning and exits with code `1`  
4. Jenkins job is triggered on every push  
5. Jenkins pulls latest code and runs the script  
6. Build is marked **SUCCESS** or **FAILURE** based on disk usage

---

## 📄 Script: `disk-check.sh`

```bash
#!/bin/bash

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

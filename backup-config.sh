#!/bin/bash
# Backup OpenClaw config and workspace files
BACKUP_DIR=~/workspace/backups
TIMESTAMP=$(date +%Y%m%d-%H%M%S)
BACKUP_FILE="$BACKUP_DIR/openclaw-config-$TIMESTAMP.tar.gz"

# Files to backup
tar -czf "$BACKUP_FILE" \
  ~/.openclaw/openclaw.json \
  ~/.openclaw/agents/main/agent/ 2>/dev/null

# Keep last 7 backups, remove older
ls -t "$BACKUP_DIR"/openclaw-config-*.tar.gz 2>/dev/null | tail -n +8 | xargs -r rm

echo "Backup created: $BACKUP_FILE"
echo "Backups kept: $(ls -1 "$BACKUP_DIR"/openclaw-config-*.tar.gz 2>/dev/null | wc -l)"

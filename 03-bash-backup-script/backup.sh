#!/bin/bash

BACKUPS_TO_KEEP="${BACKUPS_TO_KEEP:-3}"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Directories
# Defaults are the course paths; override with env vars
SRC_DIR="${SRC_DIR:-$HOME/dev/tar4/my_test_project/personal}"
DEST_BASE="${DEST_BASE:-$HOME/dev/tar4/my_test_project/backups}"
BACK_UP_DEST="$DEST_BASE/backup_archive_$TIMESTAMP"

# Make sure backups dir exist, otherwise create it
mkdir -p "$BACK_UP_DEST"

# Copy content
cp -a "$SRC_DIR"/. "$BACK_UP_DEST"/
echo "Backup created: $BACK_UP_DEST"

# Get backup directories
BACKUPS=("$DEST_BASE"/backup_archive_*)
#BACKUPS=($(find "$DEST_BASE" -maxdepth 1 -type d -name "backup_archive_*" | sort))

TOTAL=${#BACKUPS[@]}

# Keep last BACKUPS_TO_KEEP backups
if [ "$TOTAL" -gt "$BACKUPS_TO_KEEP" ]; then
    NUM_TO_DELETE=$((TOTAL - BACKUPS_TO_KEEP))
    OLD_BACKUPS=("${BACKUPS[@]:0:$NUM_TO_DELETE}")
    echo "Max allowed back-ups is $BACKUPS_TO_KEEP, deleting $NUM_TO_DELETE:"

    for back_up in "${OLD_BACKUPS[@]}"; do
        echo "Deleting old backup: $back_up"
        rm -rf "$back_up"
    done
fi

echo "Backup process completed."

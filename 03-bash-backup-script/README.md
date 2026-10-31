# 03 – Bash backup script with rotation

Lecture 4. Write a Linux script that copies `~/personal` to `~/backup_archive_<timestamp>` on every run and keeps only the three newest backups, to save space.

## How [`backup.sh`](backup.sh) works

1. Builds a timestamp (`YYYY-MM-DD_HH-MM-SS`) and creates `$DEST_BASE/backup_archive_<timestamp>`.
2. Copies everything in `$SRC_DIR` into it with `cp -a`, which keeps permissions, timestamps and hidden files.
3. Lists the existing `backup_archive_*` folders. The timestamp format sorts by name, so the oldest come first.
4. If there are more than `BACKUPS_TO_KEEP` (3), deletes the oldest ones.

## Usage

```bash
./backup.sh                                          # course defaults
SRC_DIR=~/personal DEST_BASE=~ ./backup.sh           # paths from the exercise
```

`SRC_DIR`, `DEST_BASE` and `BACKUPS_TO_KEEP` can be set as environment variables. The CI workflow uses this to test the rotation in a temp directory.

Example output after a fourth run:

```
Backup created: /home/user/backups/backup_archive_2025-11-18_08-20-11
Max allowed back-ups is 3, deleting 1:
Deleting old backup: /home/user/backups/backup_archive_2025-11-18_06-52-24
Backup process completed.
```

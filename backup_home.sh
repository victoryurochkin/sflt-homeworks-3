#!/usr/bin/env bash

SRC="$HOME/"
DEST="/tmp/backup/"
LOGTAG="backup_home_rsync"

# Создаём директорию для бэкапа, если её ещё нет
mkdir -p "$DEST"

# Опции rsync: архивный режим + зеркалирование
RSYNC_OPTS="-a --delete"

# Запускаем rsync и логируем результат в syslog
if rsync $RSYNC_OPTS "$SRC" "$DEST" >/tmp/backup_rsync.log 2>&1; then
    logger -t "$LOGTAG" "Backup succeeded"
else
    logger -t "$LOGTAG" "Backup FAILED. See /tmp/backup_rsync.log"
fi

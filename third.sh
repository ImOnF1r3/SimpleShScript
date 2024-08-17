#!/bin/bash

backup_directory() {
    read -p "Enter the directory you want to back up: " TARGET_DIR

    if [[ ! -d $TARGET_DIR ]]; then
        echo "Directory not found!"
        exit 1
    fi

    BACKUP_LOCATION="./backup"

    mkdir -p "$BACKUP_LOCATION"
    DIR_NAME=$(basename "$TARGET_DIR")
    TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
    BACKUP_NAME="${DIR_NAME}_$TIMESTAMP.tar.gz"
    tar -czf "$BACKUP_LOCATION/$BACKUP_NAME" -C "$(dirname "$TARGET_DIR")" "$DIR_NAME"

    echo "Backup created at $BACKUP_LOCATION/$BACKUP_NAME"
}

backup_directory

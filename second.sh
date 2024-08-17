#!/bin/bash

organize_files() {
    if [[ -z $1 ]]; then
        echo "Please provide a directory to organize."
        exit 1
    fi

    TARGET_DIR="$1"

    if [[ ! -d $TARGET_DIR ]]; then
        echo "Directory not found!"
        exit 1
    fi

    for file in "$TARGET_DIR"/*; do
        if [[ -f $file ]]; then
            EXT="${file##*.}"

            mkdir -p "$TARGET_DIR/$EXT"
            mv "$file" "$TARGET_DIR/$EXT/"
        fi
    done
    echo "Files have been organized."
}

organize_files "$1"

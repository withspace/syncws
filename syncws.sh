#!/usr/bin/env bash

target="$1"

function syncFile {
  to_sync=`git ls-files $1`

  if [ -n "$to_sync" ]
  then
    echo "$target/$to_sync"
    scp "$to_sync" "$target/$to_sync" # some utils do not discover changes made by rsync
  fi
}

function syncOnce {
  rsync -rzv --exclude='.git' --filter="dir-merge,- .gitignore" ./ "$target"
}

function startLiveSync {
  fswatch -r . | while read file; do syncFile "$file" ; done
}

function printHelp {
  echo "Usage example: syncws user@127.0.0.1:/tmp/mydir"
}

if [ -n "$target" ]
then
  syncOnce && startLiveSync
else
  printHelp
fi

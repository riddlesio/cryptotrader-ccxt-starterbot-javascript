#!/usr/bin/env bash

mkdir -p build
git_commit_hash=$(git rev-parse --short HEAD)
if [ -n "$(git status --porcelain)" ]; then
    timestamp=$(date --iso-8601=seconds)
    zip_filename="build/bot.${git_commit_hash}.${timestamp}-dirty.zip"
else
    zip_filename="build/bot.${git_commit_hash}.zip"
fi
zip $zip_filename -r main.js src
echo $zip_filename
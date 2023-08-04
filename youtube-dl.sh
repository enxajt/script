#!/usr/bin/env bash

echo "youtube-dl"
echo -n "URL: "
read -r url

python3 /usr/bin/youtube-dl -f bestvideo[ext!=webm]+bestaudio[ext!=webm]/best[ext!=webm]  -o "%(title)s.%(id)s.%(ext)s" "$url"

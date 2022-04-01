#!/usr/bin/env bash

echo "youtube-dl"
echo -n "URL: "
read -r url

python3 /usr/local/bin/youtube-dl -f bestvideo[ext!=webm]+bestaudio[ext!=webm]/best[ext!=webm]  -o "%(id)s.%(ext)s" "$url"

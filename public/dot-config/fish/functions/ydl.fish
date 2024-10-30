function ydl
  yt-dlp \
    --format "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" \
    --hls-prefer-ffmpeg \
    --merge-output=mp4 \
    --no-mtime \
    --no-overwrites \
    --no-warnings \
    --output "%(title)s.%(ext)s" \
    --playlist-random \
    --restrict-filenames \
    --user-agent="Mozilla/5.0" \
    $argv
end

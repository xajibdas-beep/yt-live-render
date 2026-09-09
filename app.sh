#!/bin/bash

# ১. আপনার ইউটিউব লাইভ Stream Key-টি নিচে দিন
STREAM_KEY="আপনার_ইউটিউব_স্ট্রিম_কি"

# ২. আপনার ২২ মিনিটের ভিডিওর লিংক
YT_VIDEO_URL="https://youtube.com"

echo "Downloading video directly from YouTube to Render Cloud..."
/usr/local/bin/yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" "$YT_VIDEO_URL" -o "stream_video.mp4"

echo "Starting 24/7 Unlimited Live Stream on YouTube..."
while true
do
  ffmpeg -re -stream_loop -1 -i stream_video.mp4 \
  -c:v libx264 -preset superfast -b:v 2000k -maxrate 2000k -bufsize 4000k \
  -c:a aac -b:a 128k -ar 44100 \
  -f flv "rtmp://://youtube.com"

  echo "Stream crashed or disconnected. Restarting loop in 5 seconds..."
  sleep 5
done

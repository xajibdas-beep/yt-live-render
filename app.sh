#!/bin/bash

# ১. আপনার আসল ইউটিউব লাইভ Stream Key
STREAM_KEY="kavx-rgks-8ygz-gmq8-fkxs"

# ২. আপনার ২২ মিনিটের আসল ইউটিউব ভিডিওর লিঙ্ক
YT_VIDEO_URL="https://youtu.be"

echo "Downloading video directly from YouTube to Server..."
# লোকাল ফোল্ডারের yt-dlp ব্যবহার করে ডাউনলোড করা
./yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" "$YT_VIDEO_URL" -o "stream_video.mp4"

if [ ! -f "stream_video.mp4" ]; then
    echo "Error: Video download failed! Exiting..."
    exit 1
fi

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

#!/bin/bash

# ১. আপনার আসল ইউটিউব লাইভ Stream Key
STREAM_KEY="kavx-rgks-8ygz-gmq8-fkxs"

# ২. গুগল ড্রাইভ থেকে বানানো আপনার ভিডিওর ডাইরেক্ট ডাউনলোড লিঙ্ক (১০০% ফিক্সড)
VIDEO_URL="https://google.com"

echo "Downloading video directly from Google Drive Storage to Server..."
# গুগল ড্রাইভের বড় ফাইল ডাউনলোডের বিশেষ লিনাক্স কমান্ড
wget --no-check-certificate "$VIDEO_URL" -O stream_video.mp4

# ফাইলটি সঠিকভাবে ডাউনলোড হয়েছে কিনা তা সার্ভারকে চেক করানো
if [ ! -f "stream_video.mp4" ]; then
    echo "Error: Video download from Google Drive failed! Exiting..."
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

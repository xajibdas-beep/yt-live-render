#!/bin/bash

# ১. আপনার আসল ইউটিউব লাইভ Stream Key
STREAM_KEY="kavx-rgks-8ygz-gmq8-fkxs"

echo "Downloading video safely from Google Drive API..."
# গুগল ড্রাইভের নতুন সিকিউরিটি বাইপাস করার জন্য সরাসরি এপিআই ডাউনলোড লিঙ্ক
wget --no-check-certificate 'https://google.com' -O stream_video.mp4

# ফাইলটি সঠিকভাবে ডাউনলোড হয়েছে কিনা তা সার্ভারকে চেক করানো
if [ ! -f "stream_video.mp4" ] || [ ! -s "stream_video.mp4" ]; then
    echo "Error: Video file is empty or download failed! Exiting..."
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

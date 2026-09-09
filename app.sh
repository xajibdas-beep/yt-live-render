#!/bin/bash

# ১. আপনার আসল ইউটিউব লাইভ Stream Key
STREAM_KEY="kavx-rgks-8ygz-gmq8-fkxs"

# ২. GoFile থেকে বের করা আপনার ভিডিওর আসল ডাইরেক্ট ডাউনলোড লিঙ্ক
VIDEO_URL="https://gofile.io"

echo "Downloading video safely from high-speed Server..."
# কোনো সিকিউরিটি ওয়ার্নিং বা সাইজ লিমিট ছাড়াই ডাইরেক্ট ওয়ান-ক্লিক ডাউনলোড কমান্ড
wget -q --no-check-certificate "$VIDEO_URL" -O stream_video.mp4

# ফাইলটি সঠিকভাবে ডাউনলোড হয়েছে কিনা তা ভেরিফাই করা
if [ ! -f "stream_video.mp4" ] || [ ! -s "stream_video.mp4" ]; then
    echo "Error: Video download failed! Exiting..."
    exit 1
fi

echo "Video Verification Passed! Starting 24/7 Unlimited Live Stream..."
while true
do
  ffmpeg -re -stream_loop -1 -i stream_video.mp4 \
  -c:v libx264 -preset superfast -b:v 2000k -maxrate 2000k -bufsize 4000k \
  -c:a aac -b:a 128k -ar 44100 \
  -f flv "rtmp://://youtube.com"
  
  echo "Stream crashed or disconnected. Restarting loop in 5 seconds..."
  sleep 5
done

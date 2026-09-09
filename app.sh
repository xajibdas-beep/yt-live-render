#!/bin/bash

# ১. আপনার আসল ইউটিউব লাইভ Stream Key
STREAM_KEY="kavx-rgks-8ygz-gmq8-fkxs"

# ২. BashUpload থেকে পাওয়া আপনার ভিডিওর আসল ডাইরেক্ট লিঙ্কটি নিচে দিন
VIDEO_URL="এখানে_আপনার_BashUpload_থেকে_পাওয়া_লিঙ্কটি_বসাবেন"

echo "Downloading video safely from high-speed Linux Cloud Storage..."
# কোনো কুকি বা ওয়ার্নিং ছাড়াই ডাইরেক্ট ওয়ান-ক্লিক ডাউনলোড কমান্ড
wget -q --no-check-certificate "$VIDEO_URL" -O stream_video.mp4

# ফাইলটি সঠিকভাবে এবং সম্পূর্ণ সাইজে ডাউনলোড হয়েছে কিনা তা চেক করা
if [ ! -f "stream_video.mp4" ] || [ ! -s "stream_video.mp4" ]; then
    echo "Error: Video file is empty or download failed! Exiting..."
    exit 1
fi

echo "Video Verification Passed! Size is regular."
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

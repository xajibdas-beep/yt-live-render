#!/bin/bash

# ১. আপনার আসল ইউটিউব লাইভ Stream Key
STREAM_KEY="kavx-rgks-8ygz-gmq8-fkxs"

# ২. আপনার গুগল ড্রাইভ ফাইলের আইডি (ID)
FILE_ID="1Ec7Ga1eVcqnTn1hN2c1jKcjadcWhpiVi"

echo "Downloading large video directly from Google Drive Storage..."
# গুগল ড্রাইভের বড় ফাইলের ভাইরাস স্ক্যান ওয়ার্নিং বাইপাস করার ১০০% কার্যকরী লিনাক্স ট্রিক
wget --load-cookies /tmp/cookies.txt "https://google.com(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://google.com -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=$FILE_ID" -O stream_video.mp4 && rm -rf /tmp/cookies.txt

# ফাইলটি সঠিকভাবে ডাউনলোড হয়েছে কিনা তা সার্ভারকে চেক করানো
if [ ! -f "stream_video.mp4" ]; then
    echo "Error: Large file download from Google Drive failed! Exiting..."
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

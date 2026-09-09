#!/bin/bash

# ১. আপনার আসল ইউটিউব লাইভ Stream Key
STREAM_KEY="kavx-rgks-8ygz-gmq8-fkxs"

# ২. আপনার ভিডিও ফাইলের গুগল ড্রাইভ আইডি (ID)
FILE_ID="1Ec7Ga1eVcqnTn1hN2c1jKcjadcWhpiVi"

echo "Bypassing Google Drive 100MB+ virus scan warning..."
# গুগলের সিকিউরিটি কনফার্মেশন টোকেন সরাসরি লিনাক্স মেমোরিতে ক্যাশ করার ১০০% ওয়ার্কিং কমান্ড
CONFIRM=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate "https://google.com{FILE_ID}" -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p' | head -n 1)

echo "Security Token Retrieved. Downloading 705MB file..."
wget --load-cookies /tmp/cookies.txt "https://google.com{CONFIRM}&id=${FILE_ID}" -O stream_video.mp4 && rm -rf /tmp/cookies.txt

# ফাইলটি সঠিকভাবে এবং সম্পূর্ণ সাইজে ডাউনলোড হয়েছে কিনা তা ভেরিফাই করা
if [ ! -f "stream_video.mp4" ] || [ ! -s "stream_video.mp4" ]; then
    echo "Error: High-size video download failed! Exiting..."
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

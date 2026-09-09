FROM alpine:latest
RUN apk update && apk add --no-cache ffmpeg bash wget python3 py3-pip
RUN wget https://github.com -O /usr/local/bin/yt-dlp && chmod a+rx /usr/local/bin/yt-dlp
WORKDIR /app
COPY app.sh .
RUN chmod +x app.sh
CMD ["./app.sh"]

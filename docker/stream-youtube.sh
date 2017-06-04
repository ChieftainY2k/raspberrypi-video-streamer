#!/bin/bash

# echo Your youtube stream secret key is: $1

#STREAMER_YOUTUBE_SECRET=$1
#STREAMER_BITRATE=$2

if [ -z "$STREAMER_YOUTUBE_SECRET" ]; then
    echo STREAMER_YOUTUBE_SECRET is empty, exiting.
    exit
fi

if [ -z "$STREAMER_BITRATE" ]; then
    STREAMER_BITRATE=3000000
    echo STREAMER_BITRATE is empty, falling back to default: $STREAMER_BITRATE
fi

if [ -z "$STREAMER_FPS" ]; then
    STREAMER_FPS=25
    echo STREAMER_BITRATE is empty, falling back to default: $STREAMER_BITRATE
fi

echo Youtube key = $STREAMER_YOUTUBE_SECRET
echo Video bitrate = $STREAMER_BITRATE
echo Video FPS = $STREAMER_FPS

raspivid -o - -t 0 -w 1920 -h 1080 -fps $STREAMER_FPS -b $STREAMER_BITRATE -g 40 | ffmpeg \
	-re -ar 44100 -ac 2 -acodec pcm_s16le -f s16le -ac 2 -i /dev/zero \
	-f h264 -i pipe:0 -c:v copy -c:a aac -ab 128k -g 40 -strict experimental \
	-f flv -r 30 rtmp://a.rtmp.youtube.com/live2/$STREAMER_YOUTUBE_SECRET




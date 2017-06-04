#!/bin/bash

if [ -z "$STREAM_YOUTUBE_SECRET" ]; then
    echo STREAM_YOUTUBE_SECRET is empty, exiting.
    exit
fi

if [ -z "$STREAM_BITRATE" ]; then
    STREAM_BITRATE=3000000
    echo STREAM_BITRATE is empty, falling back to default: $STREAM_BITRATE
fi

if [ -z "$STREAM_FPS" ]; then
    STREAM_FPS=25
    echo STREAM_BITRATE is empty, falling back to default: $STREAM_BITRATE
fi

if [ -z "$STREAM_WIDTH" ]; then
    STREAM_WIDTH=1920
    echo STREAM_WIDTH is empty, falling back to default: $STREAM_WIDTH
fi

if [ -z "$STREAM_HEIGHT" ]; then
    STREAM_HEIGHT=1080
    echo STREAM_HEIGHT is empty, falling back to default: $STREAM_HEIGHT
fi

echo ----------------------------------------------------------------------
echo Initiating stream with following params:
echo Youtube key = $STREAM_YOUTUBE_SECRET
echo Stream bitrate = $STREAM_BITRATE
echo Stream FPS = $STREAM_FPS
echo Stream width = $STREAM_WIDTH
echo Stream height = $STREAM_HEIGHT
echo ----------------------------------------------------------------------

raspivid -o - -t 0 -w $STREAM_WIDTH -h $STREAM_HEIGHT -fps $STREAM_FPS -b $STREAM_BITRATE -g 40 | ffmpeg \
	-re -ar 44100 -ac 2 -acodec pcm_s16le -f s16le -ac 2 -i /dev/zero \
	-f h264 -i pipe:0 -c:v copy -c:a aac -ab 128k -g 40 -strict experimental \
	-f flv -r $STREAM_FPS rtmp://a.rtmp.youtube.com/live2/$STREAM_YOUTUBE_SECRET


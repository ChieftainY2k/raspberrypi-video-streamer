* Get Raspberry PI, cnfigure it so that it can connect to the internet.

* Install docker
<pre>
$ curl -sSL get.docker.com | sh
$ sudo usermod pi -aG docker
$ reboot
</pre>
        
* Build docker image
<pre>
$ cd docker
$ docker build -t streamer .
</pre>
 
* Initiate and run streamer for the first time
<pre>
$ docker run --privileged -e STREAM_YOUTUBE_SECRET="xxxxxxxxxxxxxxxx" -e STREAM_BITRATE=500000 -e STREAM_FPS=30 -e STREAM_WIDTH=800 -e STREAM_HEIGHT=600 --name camera streamer
</pre>

* Stop streamer (may take a while)
<pre>
$ docker stop camera  
</pre>

* Start streamer again
<pre>
$ docker start camera
</pre>

* Attach to streamer console
<pre>
$ docker attach camera
</pre>

* Kill streamer process and remove container
<pre>
$ docker rm -f camera
</pre>

* (optional) Install python PIP
<pre>
$sudo apt-get install python3-pip
</pre>

* (optional) Install docker-compose
<pre>
$ sudo pip3 install docker-compose
</pre>


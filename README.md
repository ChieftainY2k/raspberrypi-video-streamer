* Get Raspberry PI
* Install Jessie image and configure it so that it can connect to the internet
* Make sure camera module is enabled

* Install docker
<pre>
$ curl -sSL get.docker.com | sh
$ sudo usermod pi -aG docker
$ reboot
</pre>
        
* Build docker image for the "camera" container
<pre>
$ docker build -t streamer ./docker 
</pre>
 
* Initiate and run streamer container for the first time
<pre>
$ docker run --detach --restart unless-stopped --privileged -e STREAM_YOUTUBE_SECRET="xxxxxxxxxxxxxxxx" -e STREAM_BITRATE=500000 -e STREAM_FPS=30 -e STREAM_WIDTH=800 -e STREAM_HEIGHT=600 --name camera streamer
</pre>
Note: stream will restart automatically on reboot or failure unless you stop it with the "docker stop" command. 

* Stop the stream (may take a while)
<pre>
$ docker stop camera  
</pre>

* Start the stream again
<pre>
$ docker start camera
</pre>

* Attach to container console
<pre>
$ docker attach camera
</pre>

* Kill stream process and remove container
<pre>
$ docker rm -f camera
</pre>

* Display container logs
<pre>
$ docker logs camera
</pre>

* (optional) Install python PIP
<pre>
$sudo apt-get install python3-pip
</pre>

* (optional) Install docker-compose
<pre>
$ sudo pip3 install docker-compose
</pre>


* Get Raspberry PI, cpnfigure it so that it can connect to the internet.

* Install docker
<pre>
$ curl -sSL get.docker.com | sh
$ sudo usermod pi -aG docker
$ reboot
</pre>
        
* Install python PIP
<pre>
$sudo apt-get install python3-pip
</pre>

* Install docker-compose
<pre>
$ sudo pip3 install docker-compose
</pre>

* Build docker image
<pre>
$ cd docker
$ docker build -t streamer .
</pre>
 
* Initiate and run streamer for the first time
<pre>
$  docker run --privileged -e STREAMER_YOUTUBE_SECRET="xxxxxxxxxxxxxxxx" -e STREAMER_BITRATE=500000 -e STREAMER_FPS=30 --name camera streamer
</pre>

* Stop streamer
<pre>
$  docker kill camera
</pre>

* Start streamer again
<pre>
$  docker start camera
</pre>

* Attach to streamer console
<pre>
$  docker attach camera
</pre>



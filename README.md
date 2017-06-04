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
 
* Run streamer

<pre>
$ docker run -e STREAMER_YOUTUBE_SECRET="xxxxxxxxx" -e STREAMER_BITRATE=500000 --name camera streamer
</pre>


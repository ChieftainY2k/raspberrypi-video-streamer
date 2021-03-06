This project is inspired and based on the alexellis/raspberrypi-youtube-streaming code and docker image.

The app was tested against Raspberry Pi A and Raspberry Pi 2 

* Get Raspberry PI
* Install Jessie image and configure it so that it can connect to the internet
* Update firmware (rpi-update) and software (apt-get update && at-get upgrade)
* Make sure camera module is enabled (raspi-config)

* Get your stream secret key (STREAM_YOUTUBE_SECRET) from https://www.youtube.com/live_dashboard

* Install docker
<pre>
$ curl -sSL get.docker.com | sh
$ sudo usermod pi -aG docker
$ reboot
</pre>
        
* Clone this repository
<pre>
$ git clone https://github.com/ChieftainY2k/raspberrypi-video-streamer 
</pre>
 
* Goto repo directory
<pre>
$ cd raspberrypi-video-streamer
</pre>
 
* Build docker image for the "camera" container
<pre>
$ docker build -t streamer ./docker 
</pre>
 
* Initiate and run streamer container (replace xxxxxxx with your secret key)
<pre>
$ docker run --detach --restart unless-stopped --privileged -e STREAM_YOUTUBE_SECRET="xxxxxxxxxxxxxxxx" -e STREAM_BITRATE=500000 -e STREAM_FPS=30 -e STREAM_WIDTH=800 -e STREAM_HEIGHT=600 --name camera streamer
</pre>
Note: stream container will restart automatically on reboot or failure unless you stop it with the "docker stop" command. 

* Go to https://www.youtube.com/live_dashboard and chech if your stream is live

* Stop the streamer container (may take a while)
<pre>
$ docker stop camera  
</pre>

* Start the stopped streamer container
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

* Show container logs
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


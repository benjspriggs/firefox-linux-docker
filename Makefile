and-remove:
	docker run -it --rm \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		--device /dev/snd \
		--name firefox \
		benjspriggs/firefox-linux-docker

all:
	docker run -it \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		--device /dev/snd \
		--name firefox \
		benjspriggs/firefox-linux-docker

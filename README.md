
# hdsentinel

  

This is a docker for use with HDSentinel disk diag program NAS and Linux features <https://www.hdsentinel.com/index.php>

This container currently only support amd64. It allows your to see all of your drive health across your NAS Linux devices in the windows application or simply just the ip of your docker host.

  

<img  src="https://github.com/scyto/hdsentinel/raw/master/images/hdsentinel.png"  style="max-width:100%;">

  

This container *MUST* be run in --privlileged mode to have access to disks (aka the container has near-root privileges across all containers and the host).

  

This is not ideal but there seems to be no other way and is less intrusive to a base NAS (like a Synology) where support gets funny if you mess around too much. If you know of a way to make this container run unpriviledged please let me know!

  

## I used caddy here for the simplicity of just 4 lines in the config

  

## **INSTALL**

  

1. Clone the repo using git clone or wget

  

2. Make sure you have Docker & Docker-Compose installed! https://docs.docker.com/compose/install/

  

3. Run ```docker compose up -d``` :D

## ToDo

  

1. allow passing of variables to the crond logging level

2. allow passing of variables to the hdsentinel command line

3. figure out how to support arm (the base image used only support amd64 due to lack of glibc on mainline alpine)

  

Note if you want to attach an interactive tty use /bin/sh (not bash)

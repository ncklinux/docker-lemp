# docker-lemp
Docker local development environment with PHP, NGiNX, MySQL/MariaDB (LEMP stack)

Download and install [Docker](https://www.docker.com), for Arch Linux follow the [wiki](https://wiki.archlinux.org/index.php/docker), for OSX and Windows use the [official documentation](https://docs.docker.com/get-started/).

For Ubuntu 20.04 install Docker from the official Docker repository, do the following:
```
$ sudo apt update
$ sudo apt install apt-transport-https ca-certificates curl software-properties-common
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
$ sudo apt update
$ apt-cache policy docker-ce
$ sudo apt install docker-ce
$ sudo systemctl status docker
$ sudo usermod -aG docker ${USER}
```
Then logout (and login) or reboot (to apply the new group membership)
```
$ su - ${USER}
```
Check that your user is part of the group
```
$ id -nG
```
To add other users
```
$ sudo usermod -aG docker username
```

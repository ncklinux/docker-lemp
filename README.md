# docker-lemp
Docker local development environment with PHP, NGiNX, MySQL/MariaDB (LEMP stack)

Download and install [Docker](https://www.docker.com), on Arch Linux follow the [wiki](https://wiki.archlinux.org/index.php/docker), on OSX and Windows use the [official documentation](https://docs.docker.com/get-started/).

On Ubuntu 20.04 install it from the official Docker repository (to ensure we get the latest version), do the following:
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
Check that your user is part of the group and view all docker parameters
```
$ id -nG
$ docker
```
Add other users (if you need to)
```
$ sudo usermod -aG docker some_username
```

Lastly, you may need (but is not required) an account to [Docker Hub](https://hub.docker.com) if you like to [build your own images](https://docs.docker.com/get-started/part2/) and push them to Docker Hub.

## Support
The above project has been tested/hosted on [Arch Linux](https://www.archlinux.org/) but there are no differences between distributions (only the Docker installation process differs), for reporting bugs and requesting features it's best to open an issue. It's even better to accompany it with a Pull Request. ;)

## License
GNU General Public License v3.0

## Alternative to Docker?
You could use [Vagrant!](https://github.com/ncklinux/vagrant-ubuntu64)

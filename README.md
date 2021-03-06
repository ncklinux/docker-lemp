# docker-lemp
Docker local development environment with PHP, NGiNX, MySQL/MariaDB (LEMP stack)

Download and install [Docker](https://www.docker.com) and docker-compose, on Arch Linux follow the [wiki](https://wiki.archlinux.org/index.php/docker) and also install [docker-compose](https://www.archlinux.org/packages/community/any/docker-compose/). On OSX and Windows use the [official documentation](https://docs.docker.com/get-started/).

![Screenshot](./media/docker_phpinfo.png)

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
To install Docker Compose, check the latest updated stable [version](https://github.com/docker/compose/releases) (replace X.XX.X with your version)
```
$ sudo curl -L "https://github.com/docker/compose/releases/download/X.XX.X/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
$ sudo chmod +x /usr/local/bin/docker-compose
$ docker-compose --version
```
Run docker-compose and check the ports
```
$ git clone git@github.com:ncklinux/docker-lemp.git
$ cd docker-lemp
$ docker-compose up -d
$ docker-compose ps
$ netstat -tupln
```
Test MariaDB root access, password: ncklinux_root and add some data [localhost/mysql_connection_test.php](http://localhost/mysql_connection_test.php)
```
$ docker-compose exec mysql bash
$ mysql -u root -p
$ SHOW DATABASES;
$ USE test;
$ CREATE TABLE authors (id INT, name VARCHAR(20), email VARCHAR(20));
$ SHOW TABLES;
$ INSERT INTO authors (id,name,email) VALUES(1,"ncklinux1","ncklinux1@test.com");
$ INSERT INTO authors (id,name,email) VALUES(1,"ncklinux2","ncklinux2@test.com");
$ SELECT * FROM authors;
```
![Screenshot](./media/mariadb_test.png)
Modify/copy your files in the public directory and refresh [http://localhost](http://localhost) on your browser (with F5 or Ctrl+F5). Also use "docker-compose exec phpfpm bash" (without quotes) to access the files on the container.
```
$ cd public
$ ls -la
```
Stop and remove all docker containers and images
```
$ docker ps -aq
$ docker stop $(docker ps -aq)
$ docker rm $(docker ps -aq)
$ docker rmi $(docker images -q)
```
Another way to remove all stopped containers
```
$ docker-compose ps
$ docker-compose stop
$ docker container prune
$ docker images
$ docker rmi mariadb nginx bitnami/php-fpm
$ docker ps && docker ps -a && docker images
```
Also, the command below removes all stopped containers, dangling images and unused networks. The command will prompt you to confirm the operation "Are you sure you want to continue? [y/N]", just type "y" (without quotes)
```
$ docker system prune
```
Check also the best practices for writing [Dockerfiles](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)

Lastly, you may need (but it is not necessary for this project) an account to [Docker Hub](https://hub.docker.com), just in case, if you like to [build your own images](https://docs.docker.com/get-started/part2/) and push them up to Docker Hub.

## Support
The above project has been tested/hosted on [Arch Linux](https://www.archlinux.org/) but there are no differences between distributions (only the Docker installation process differs e.g. Arch Linux provides Pacman, Ubuntu Apt etc), for reporting bugs, requesting features or better methods, it's best to open an issue. It's even better to accompany it with a Pull Request. ;)

## License
GNU General Public License v3.0

## Alternative to Docker?
You could use [Vagrant!](https://github.com/ncklinux/vagrant-ubuntu64)

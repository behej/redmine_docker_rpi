# Redmine on RaspberryPi with docker
## Intro
Redmine server instance on a docker container running on RaspberryPi 4.
## Design
* 3 containers
  * Redmine
  * Postgresql database
  * Git repositories storage
* 1 network
* 3 volumes
  * `db` volume to persist database
  * `data` volume to persist files uploaded to redmine
  * `repos` volume to persist Git repositories
* 1 secret file for DB password

## Installation
* Pull repository to get `docker-compose.yml` file and docker images
* Build required images: `alpine-git` and then `redmine-repos`
* Set password in file `dbpassword`
* Run command `sudo systemctl enable docker` to allow automatic start at Rpi boot

## Run Redmine
Go into directory containing `docker-compose.yml` file and execute following command
```docker-compose up -d```

### First usage
The first time you run Redmine, you need to init repositories first.
* Attach to repositories container to clone:
  * Simply attaching to container is not sufficient since container doesn't run shell command. Most suitable option is to execute a shell command to it with interractive option with binding to TTY
  * `docker container exec -it <nom_container> sh`
* Go into folder /usr/repos
* Clone all required repositories (ensure to use `--mirror` option)
  * `git clone --mirror <url>`

## Access Remine
* From any browser having access to the Raspberry, browse to  URL `<raspberry-address>:3000`
* Default login/password is `admin/admin`. You will be invited to change it at the first login


## Notes
* Once redmine has been started and DB has been initialized, password is setup and changing it requires more than simply updating the `dbpassword` file


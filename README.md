# Redmine on RaspberryPi with docker
## Intro
Redmine server instance on a docker container running on RaspberryPi 4.
## Design
* 2 containers
  * Redmine
  * Postgresql database
* 1 network
* 2 volumes
  * `db` volume to persist database
  * `data` volume to persist files uploaded to redmine
* 1 secret file for DB password

## Installation
* Pull repository to get `docker-compose.yml` file
* Set password in file `dbpassword`
* Run command `sudo systemctl enable docker` to allow automatic start at Rpi boot

## Run Redmine
Go into directory containing `docker-compose.yml` file and execute following command
```docker-compose up -d```

## Access Remine
* From any browser having access to the Raspberry, browse to  URL `<raspberry-address>:3000`
* Default login/password is `admin/admin`. You will be invited to change it at the first login


## Notes
* Once redmine has been started and DB has been initialized, password is setup and changing it requires more than simply updating the `dbpassword` file


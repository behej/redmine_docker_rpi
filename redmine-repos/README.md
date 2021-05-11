# Redmine-repos
A minimal image for repositories storage dedicated to Redmine.

## Features
* Persisted volume mounted for permanent repositories storage
* All repositories are fetched every hour


## Build image
### Pre-requisites
Image is built onto alpine-git image. Ensure that alpine-git has previously been built and is
available on the system before buiding this one.

### Instructions
Build image with following command:
```
docker build -t redmine-repos .

## Usage
* Run container with volume dedicated to persistant storage mounted in `/usr/repos`
* Clone all required repositories in /usr/repos/ using `--bare` option (required by Redmine)

Volume is now initialized. Container can be stopped and then restarted together
with Redmine container(s)

# CN-API-Dockerized

### Overview
This repo houses the dockerized version of the Laravel API 5.4 and requires both Docker and Docker Composed to be installed. Official versions of both can be found in Docker's installation documentation.

### Getting Started
First you'll need a clone of the main project in the same folder the Dockerfile is located. This allows the dockerfile to copy over all the files into the image itself. 

> You can change the folder name inside the Dockerfile to whatever folder name you desire - as long as it matches your projects name.

Next you'll need to create the folder /var/lib/mysql which is the location that Docker Compose will store the data for the database.

Next, all you need to do to get a running environment is to first build the image with:

```sh
$ docker-compose build
```

After the composed environment is downloaded and done building you'll need to fire up the system itself. To do this run:
```sh
$ docker compose up
``` 
Once this command is finished the project can be navigated to in your browser by going to http://127.0.0.1:8000
 
 > The port can be changed in the docker-compose.yml file to fit your use case.


### Database customization
All database configuration can be found in the docker-compose.yml file. Any value can be modified to fit your development environment.

By default all the data is stored inside the /var/lib/mysql folder on your local harddrive. In addition to this, the default configuration for the mysql database is:

```sh
    MYSQL_ROOT_PASSWORD=secret
    MYSQL_USER=dev_user
    MYSQL_PASSWORD=dev_pswrd
    MYSQL_DATABASE=dev_table
```

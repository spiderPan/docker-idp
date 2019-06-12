# IDP Docker

Build a Docker image that contains the environment for IDP study.

Currently, it has the followings LAMP stack in services, and will automatically implement the download repo into the environment.

1. php:7.3-apache (with pdo extention installed)
2. mariadb:10.3
3. MailHog

## Getting Started


### Prerequisites

1. [Docker](https://docs.docker.com/install/)
2. [Docker Compose](https://docs.docker.com/compose/install/)


### Installing

Currently, it's just an beta version, once the image be uploaded to docker hub, the installation will be updated

1. Clone the repo
    ```
    git clone git@github.com:spiderPan/docker-idp.git
    ```
2. Clone the target repo into the volume
    ```
    cd docker-idp
    cd ./web
    git clone https://github.com/spiderPan/Fanshawe-IDP-Moive-Review.git ./www
    ```
3. Make sure the target repo has database in "db" folder, if not please update `docker-compose.yml` file in `mysql` service's `volume` section.
4. Make sure the target rep has code the conditionally loading database host, it should looks like 
   ```
   if(getenv('STAGE')==='LOCAL'){
        $this->host='mysql';
    }
   ```
5. Running the container based on the build image
    ```
    cd ../
    docker-compose up
    ```
6. In case you need to re-initialize the container, please clean the volume by doing
    ```
    docker-compose down
    docker volume prune
    ```
    or
    ```
    docker volume ls
    docker volume rm NAME
    ```


## Running the tests
1. Once the container is ready, go to [http://localhost:8080]("http://localhost:8080"), you should see the site is up to go.
    

2. Checking the current container ID by running
    ```
    docker ps
    ```
3. Use the `CONTAINER ID` Column to replace the placeholder `CONTAINERID` in following
    ```
    docker exec -t -i CONTAINERID /bin/bash
    ```
4. Any `mail()` function will trigger email to MailHog, where can be checked in `http://localhost:8025/`
        

## Future Plan
The project can be improved by the following fields
1. Implement PHP application from gitrepo to the container
2. Run testing cases.
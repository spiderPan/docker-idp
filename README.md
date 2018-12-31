# IDP Docker

Build a Docker image that contains the environment for IDP study.

Currently, it has the followings LAMP stack

1. Ubuntu 16.04
2. Apache 2.4.18
4. MySQL 5.7.23
5. PHP 7.2
6. Postfix (configured to send mail locally)

## Getting Started


### Prerequisites

1. [Docker](https://docs.docker.com/install/)


### Installing

Currently, it's just an beta version, once the image be uploaded to docker hub, the installation will be updated

1. Clone the repo
    ```
    git clone git@github.com:spiderPan/docker-idp.git
    ```
2. Build the image
    ```
    cd docker-idp
    docker build -t fanshawe-idp .
    ```
3. Running the container based on the build image
    ```
    docker run -p 8080:80 -p 25:25 -v ${PWD}/app:/app fanshawe-idp
    ```

## Running the tests
1. Once the container is ready, go to [http://localhost:8080]("http://localhost:8080"), you should see the email sending successfully.
    

2. Checking the current container ID by running
    ```
    docker ps
    ```
3. Use the `CONTAINER ID` Column to replace the placeholder `CONTAINERID` in following
    ```
    docker exec -t -i CONTAINERID /bin/bash
    ```
        

## Future Plan
The project can be improved by the following fields
1. Implement PHP application from gitrepo to the container
2. Import DB.
3. How to automat aboves.
4. Run testing cases.
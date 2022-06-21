# Prosimos Web Application

The open-source full-stack application that allows running business process simulation with the support of differentiated resources. Additionally, it includes the discovery of the simulation parameters based on logs file (either in .xes or .csv format).

From an architectural perspective, web application consists of two parts:
1) Prosimos Web Portal implemented in React and source code is available [here](https://github.com/AutomatedProcessImprovement/prosimos-frontend).
2) Prosimos API implemented using Flask and source code is available [here](https://github.com/AutomatedProcessImprovement/prosimos-microservice).

This repository serves as an entry point to the web application. In order to run the whole web application, we are using the dockerized version of the services underneath. This is done to reduce the complexity of delivering and running the application on different machines. The repository includes two docker-compose files: for local and production usage. 


## Access deployed application

The deployed web application is available here: https://prosimos.cloud.ut.ee/.

## Use Case Example

The example used during the demo could be found in `demo_example` folder. It includes both the model and the log file (in .xes format). In order to download those files, you need to clone the whole repository.

## Running the application locally

> Please, note that you need to have `Docker` installed in order to follow the following steps. The installation instructions could be found here: https://docs.docker.com/get-docker/

0) *Pre-requisite step*: Docker is running.
1) Start the containers defined in the docker-compose file. This includes both client and web server.
    ```
    docker-compose -f local-docker-compose.yml up
    ```
2) Access http://localhost/ and start using the application.

    a) In case you want to access the API only provided by the web server, follow the following link: http://localhost:5000/apidocs/. Otherwise, you don't need to run the client at all, you can go directly to the web server repository and follow instructions provided there.

## Development
<details><summary>Development notes</summary>

### Update the VM with the new version of the api / client / certbot

If you want to roll out a new release, you can run the script available here.
Note: it will restart both `api` and `client` containers (basically, everything except `certbot`).
Otherwise, if you want to roll out a new release manually, proceed with the next steps:

1. Download new data from the repository
    ```
    sudo git fetch
    ```
2. Pull changes for the current branch
    ```
    sudo git pull
    ```
3. Two options available:
    - If you want to restart only some containers:
        ```
        sudo docker-compose up -d --no-deps <container_name>
        ```

        where `<container_name>` should be changed, for example, to `api` / `client`.
    - If you want to restart all containers inside the `docker-compose.yml`:
        ```
        sudo docker-compose up -d
        ```

</summary>

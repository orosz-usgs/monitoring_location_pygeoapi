# Monitoring Location Pygeoapi 
USGS Water Data for the Nation (WFDN) GeoApi service for monitoring locations.

## Local Configuration
This repository contains scripts to build and deploy a pygeoapi server for monitoring locations. pygeoapi is a Python
server implementation of the OGC API suite of standards. See https://pygeoapi.io/ for more details.

The server is packaged and deployed as a docker container. The server's configuration is set by local.config.yml
file.
 
To run in a development environment, create an .env file in
the project root directory containing the following (shown are example values):

...
NWIS_DATABASE_ADDRESS=<192.168.0.1>
NWIS_DATABASE_PORT=<5434>
NWIS_DATABASE_NAME->nwis_db>

NWIS_SCHEMA_NAME=<nwis>
NWIS_SCHEMA_OWNER_USERNAME=<nwis_owner>
NWIS_SCHEMA_OWNER_PASSWORD=<changeMe>

PYGEOAPI_SERVER_URL=<server_url>
PYGEOAPI_SERVER_PORT=<5000>
SCRIPT_NAME=</api/ogcAPI>
```

...
docker network create -d bridge --subnet 192.168.0.0/24 --gateway 192.168.0.1 mynet
...

#### Environment variable definitions

* **NWIS_DATABASE_HOST** - Host name or IP address of the NWIS database. Must be reachable from inside the
container.
* **NWIS_DATABASE_PORT** - Port of the NWIS database.
* **NWIS_DATABASE_PORT** - Port of the NWIS database.
* **NWIS_DATABASE_NAME** - Name of the PostgreSQL database to containing the nwis schema.

* **NWIS_SCHEMA_NAME** - Name of the schema holding the nwis database objects.
* **NWIS_SCHEMA_OWNER_USERNAME** - username used to login to the NWIS database
* **NWIS_SCHEMA_OWNER_PASSWORD** - password used to login to the NWIS database

* **PYGEOAPI_SERVER_URL** - The fully qualified url used to connect to the pygeoapi server.
* **PYGEOAPI_SERVER_PORT** - Port used to connect to API geo server.

* **SCRIPT_NAME** - The url path used to access the API geo server.

### Testing
The pygeoapi server can be tested locally by spinning up the docker container.

```
% docker-compose up monitoring_location_pygeoapi
```

The application can be accessed at: ${PYGEOAPI_SERVER_URL}
e.g. http://localhost:5000/api/ogcAPI

### Other Helpful commands include:
* __docker-compose up__ to create and start the containers
* __docker-compose ps__ to list the containers
* __docker-compose stop__ or __docker-compose kill__ to stop the containers
* __docker-compose start__ to start the containers
* __docker-compose rm__ to remove all containers
* __docker network ls__ to get a list of local docker network names
* __docker network inspect XXX__ to get the ip addresses of the running containers
* __docker-compose ps -q__ to get the Docker Compose container ids
* __docker ps -a__ to list all the Docker containers
* __docker rm <containerId>__ to remove a container
* __docker rmi <imageId>__ to remove an image
* __docker logs <containerID>__ to view the Docker Compose logs in a container


# scorekeeper-dockerize

Built a pretty simple scorekeeper app and dockerized it.

Used Apache server to host the files for the static webpage.

The *.env* file mentions the version of the Apache server image, the external port to be mapped to that of the port of the Apache server container i.e. port 80, the desired name of the image, built and the name of the dockerfile.

```properties
APACHE_VERSION=alpine
PORT=8000
IMAGE_NAME=abhishekpawl/scorekeeper
DOCKERFILE_NAME=Dockerfile
```

The *Dockerfile* contains the metadata to build the image.

```docker
ARG APACHE_VERSION
FROM httpd:$APACHE_VERSION
COPY . /usr/local/apache2/htdocs
```

The *docker-compose.yml* file contains the data in yaml format to build the image from the *Dockerfile* and run the containers of that image.

```yaml
version: '3'
services:
  scorekeeper:
    build:
      context: .
      dockerfile: ${DOCKERFILE_NAME}
      args:
        - APACHE_VERSION=${APACHE_VERSION}
    image: '${IMAGE_NAME}'
    ports:
      - "${PORT}:80"
```
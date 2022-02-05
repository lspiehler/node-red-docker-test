## Build

git clone https://github.com/lspiehler/node-red-docker-test.git

#cd node-red-docker-test

#git submodule update --init --recursive

docker build --pull --rm -f "Dockerfile" -t docker.io/lspiehler/node-red-project-test:latest "."

## Scan

docker scan docker.io/lspiehler/node-red-project-test

## Run

docker run -d --rm -it -p 1880:1880 -e NODE_RED_ENABLE_PROJECTS=true --name node-red-project-test docker.io/lspiehler/node-red-project-test:latest
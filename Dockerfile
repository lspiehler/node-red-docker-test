#FROM nodered/node-red:2.2.0-16
FROM nodered/node-red:latest
LABEL maintainer Lyas Spiehler

WORKDIR /usr/src/node-red

ADD ./.config.projects.json /data/

ADD ./.config.users.json /data/

RUN git clone https://github.com/lspiehler/node-red-test-project.git /data/projects/node-red-project-test

EXPOSE 1880/tcp

HEALTHCHECK CMD node /healthcheck.js

ENTRYPOINT ["npm", "--no-update-notifier", "--no-fund", "start", "--cache", "/data/.npm", "--", "--userDir", "/data"]
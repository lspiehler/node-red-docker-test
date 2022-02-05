FROM nodered/node-red:2.2.0-16
LABEL maintainer Lyas Spiehler

WORKDIR /usr/src/node-red

COPY ./.config.projects.json /data/

COPY ./.config.users.json /data/

#COPY ./node-red-test-project /data/projects/node-red-project-test
RUN git clone https://github.com/lspiehler/node-red-test-project.git /data/projects/node-red-project-test

WORKDIR /data/projects/node-red-project-test

RUN git remote set-url origin git@github.com:lspiehler/node-red-test-project.git

WORKDIR /usr/src/node-red

EXPOSE 1880/tcp

HEALTHCHECK CMD node /healthcheck.js

ENTRYPOINT ["npm", "--no-update-notifier", "--no-fund", "start", "--cache", "/data/.npm", "--", "--userDir", "/data"]
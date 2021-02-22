# Use google cloud sdk
FROM google/cloud-sdk:latest
MAINTAINER Singularities

# Install Java 8 for Pub/Sub emulator
RUN apk --update add openjdk8-jre
RUN gcloud components install pubsub-emulator --quiet
RUN gcloud components update

# Volume to persist Pub/Sub data
VOLUME /opt/data

COPY start-pubsub .

EXPOSE 8432

ENTRYPOINT ["./start-pubsub"]

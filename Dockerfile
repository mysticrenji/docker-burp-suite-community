FROM openjdk:21-slim-bullseye
LABEL maintainer="Hex <hex@cowboy.dev>"

ENV HOME /home/burp

RUN apt-get update && apt-get install -y \
  curl \
  openssl \
  ca-certificates \
  fontconfig \
  fonts-dejavu \
  libxext6 \
  libxrender1 \
  libxtst6

RUN addgroup --system burp && \
  adduser --system --ingroup burp burp

USER burp
WORKDIR $HOME

# Download the JAR
RUN curl https://portswigger.net/burp/releases/download \
  -o burpsuite_community.jar

# Set configurations
ADD config config

# Set X11 server to local machine
ENV DISPLAY=host.docker.internal:0

COPY entrypoint.sh $PWD
ENTRYPOINT ["./entrypoint.sh", "burpsuite_community.jar"]

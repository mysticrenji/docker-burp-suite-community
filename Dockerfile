FROM openjdk:11-jre-slim
LABEL maintainer="Hex <hex@cowboy.dev>"

ENV HOME /home/burp

RUN apt-get update && apt-get install -y \
  curl \
  openssl \
  ca-certificates \
  fontconfig \
  ttf-dejavu \
  libxext6 \
  libxrender1 \
  libxtst6

RUN addgroup --system burp && \
  adduser --system --ingroup burp burp

RUN mkdir -p .java/.userPrefs

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

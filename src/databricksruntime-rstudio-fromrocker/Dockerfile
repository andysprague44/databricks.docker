# Docker image to run rstudio in databricks. 
# Starts from rstudio, adds databricks

FROM rocker/rstudio:3.6.0

#Install minimum for databricks to run
RUN apt-get update \
  && apt-get install --yes \
    openjdk-8-jdk \
    iproute2 \
    bash \
    sudo \
    coreutils \
    procps \
  && /var/lib/dpkg/info/ca-certificates-java.postinst configure \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

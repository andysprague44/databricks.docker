FROM andysprague44/databricksruntime-rbase:standard

## RStudio install
RUN  apt-get update && apt-get install -y \
      alien \
      gdebi-core \
      wget \
    && cd /tmp \
    && wget https://download2.rstudio.org/rstudio-server-1.1.453-amd64.deb \
    && gdebi -n rstudio-server-1.1.453-amd64.deb

# Install cran repositories required for rstudio
COPY ./install_packages.R /
RUN Rscript /install_packages.R '2019-06-17'

# Set entry point to start rstudio daemon (on master only)
#COPY ./docker-entrypoint.sh /
#ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["R"]

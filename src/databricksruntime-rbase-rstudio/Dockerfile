FROM andysprague44/databricksruntime-rbase:2019.06.17

## copy files to container
COPY install_packages.R /install_packages.R
COPY entrypoint.sh /entrypoint.sh

# Sign it with the more secure pgp key ID as per: https://cran.rstudio.com/bin/linux/ubuntu/#secure-apt (avoiding firewall issues)
#TODO can drop this step, r-base was not removing debian source of R version 3.6.0, that is fixed so re-build should resolve (To test)
RUN gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 \
  && gpg -a --export E298A3A825C0D65DFD57CBB651716619E084DAB9 | sudo apt-key add -
  
## RStudio install
RUN  apt-get update \
    && apt-get install -y gdebi-core alien wget \
    && cd /tmp \
    && wget https://download2.rstudio.org/rstudio-server-1.1.453-amd64.deb \
    && gdebi -n rstudio-server-1.1.453-amd64.deb

# Install cran repositories required for rstudio
RUN Rscript /install_packages.R '2019-06-17'

# Set entry point to start rstudio daemon (on master only)
ENTRYPOINT ["/entrypoint.sh"]

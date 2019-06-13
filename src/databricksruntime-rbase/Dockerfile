FROM databricksruntime/minimal:latest

## copy files to container
COPY install_packages.R install_packages.R

# Ubuntu 16.04.3 LTS installs R version 3.2.3 by default. This is fairly out dated.
RUN apt-get update \
  && apt-get install --yes software-properties-common \
# Add RStudio's debian source to enable install of the latest r-base version (3.6.0 at time of writing)
  && add-apt-repository 'deb http://cran.rstudio.com/bin/linux/ubuntu xenial-cran35/' \
# Sign it with the more secure pgp key ID as per: https://cran.rstudio.com/bin/linux/ubuntu/#secure-apt (avoiding firewall issues)
  && gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 \
  && gpg -a --export E298A3A825C0D65DFD57CBB651716619E084DAB9 | sudo apt-key add - \
# Update R version (to 3.6.0)
  && apt-get update \
  && apt-get install --yes r-base r-base-dev libssl-dev \
# Tidy-up
  && apt-key del E298A3A825C0D65DFD57CBB651716619E084DAB9 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# hwriterPlus is used by Databricks to display output in notebook cells
RUN R -e "install.packages('hwriterPlus', repos='https://mran.revolutionanalytics.com/snapshot/2017-02-26')"

# Rserve allows Spark to communicate with a local R process to run R code
RUN R -e "install.packages('Rserve', repos='http://rforge.net/')"

## launch R terminal for debugging
CMD ["R"]

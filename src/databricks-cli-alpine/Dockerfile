FROM python:3.6.5-alpine3.6

ARG AzureDataBricksPAT

#Env variables can be overidden at run time, e.g.:
#docker run -it -e "DATABRICKS_TOKEN=value_of_token" databricks-cli-docker
ENV DATABRICKS_HOST "https://westeurope.azuredatabricks.net"
ENV DATABRICKS_TOKEN $AzureDataBricksPAT

RUN apk update && apk add bash
RUN pip install --upgrade pip
RUN pip install --upgrade databricks-cli

ENTRYPOINT ["/bin/bash"]

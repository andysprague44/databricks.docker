#!/bin/bash

#Run container and open bash terminal in interative mode.
#If host env variables set for DATABRICKS_TOKEN and DATABRICK_HOST it uses these, else prompts for entry

if [ -z "$DATABRICKS_HOST" ]
then
      read -p "Enter Your Databricks Host, should be in the format 'https://<region>.azuredatabricks.net': "  DATABRICK_HOST
else
      echo "host provided as env variable: $DATABRICKS_HOST"
fi

if [ -z "$DATABRICKS_TOKEN" ]
then
      read -s -p "Enter Your Databricks PAT: "  DATABRICKS_TOKEN
else
    echo "token provided as env variable"
fi

#docker run -it -e "DATABRICKS_TOKEN=$DATABRICKS_TOKEN" -e "DATABRICKS_HOST=$DATABRICKS_HOST" andysprague44/databricks-cli-alpine:latest
docker run -it -e "DATABRICKS_TOKEN=$DATABRICKS_TOKEN" -e "DATABRICKS_HOST=$DATABRICKS_HOST" databricks-cli-alpine

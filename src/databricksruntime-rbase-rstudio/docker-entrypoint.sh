#!/bin/bash

if [[ $DB_IS_DRIVER = "TRUE" ]]; then
    echo "Starting the rstudio daemon"
    rstudio-server restart
else
    echo "Not starting the rstudio daemon (this is not the spark driver)"
fi
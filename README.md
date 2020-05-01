# Databricks CLI

This repository contains methods to run the databricks cli.

## Docker

If you have docker installed:

1. Copy docker-compose.template.yml and name it 'docker-compose.yml'
2. Generate a databricks PAT <https://docs.databricks.com/dev-tools/api/latest/authentication.html>
3. Add your PAT to the DATABRICKS_TOKEN environment variable in that file
4. Run with `docker-compose up --build`

## Conda

If you don't have docker, you can use python (anaconda).

1. Create conda env: `conda env create -f conda-environment.yml python=3.6`
2. Activate: `conda activate databricks-cli`
3. Run: `databricks configure`
4. Enter host: `https://westeurope.azuredatabricks.net`
5. Username: your email
6. Password: SSO password
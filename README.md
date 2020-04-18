# covid19cvdataAPI


This R code is what was used to make an RESTful API and using R with docker.The API goal is to retrieve data about Covid19 in Cabo Verde.

There are two main file:

* server.R: this uses the plumber annotations to generate web API endpoints, the starts a local webserver.
- covidAPI.R: uses functions in R as the logic for the RESTful API.
+ data.R: loads the necessary covid19 Cabo Verde data.

# Tech Stack

#### Plumber Package
[Plumber R package](https://rplumber.io) allows users to expose existing R code as a service available to others on the Web.

#### Docker
[Docker](https://docker.com) is a tool designed to make it easier to create, deploy, and run applications by using containers. Containers allow a developer to package up an application with all of the parts it needs, such as libraries and other dependencies, and deploy it as one package.


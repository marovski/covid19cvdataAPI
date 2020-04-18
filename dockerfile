# START FROM THE ROCKER/R-VER IMAGE
FROM rocker/r-ver

#INSTALL THE LINUX LIBRARIES
RUN apt-get update -qq && apt-get install -y \
      libssl-dev \
      libcurl4-gnutls-dev
      
# Install R packages
RUN R -e "install.packages('plumber')"

RUN R -e "install.packages('devtools', repos = 'http://cran.rstudio.com/')"


#GET SCRIPTS FROM CURRENT DIRECTORY INTO THE CONTAINER
COPY / / 

#OPEN PORT 8000
EXPOSE 8000

ENTRYPOINT ["Rscript", "-e", \
"plumber::plumb('covidAPI.R')$run(host = '0.0.0.0', port= 8000)"] 

CMD ["/covidAPI.R"]
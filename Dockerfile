ARG RVERSION
FROM rocker/r-ver:$RVERSION

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y \
    libz-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libfontconfig1-dev \
    libfribidi-dev \
    libharfbuzz-dev \
    git

RUN Rscript -e "install.packages('httpuv')"
RUN Rscript -e "install.packages('shiny')"
RUN Rscript -e "install.packages('bslib')"
RUN Rscript -e "install.packages('ggplot2')"
RUN Rscript -e "install.packages('DBI')"
RUN Rscript -e "install.packages('DT')"
RUN Rscript -e "install.packages('plotly')"
RUN Rscript -e "install.packages('plu')"
RUN Rscript -e "install.packages('dplyr')"
RUN Rscript -e "install.packages('purrr')"
RUN Rscript -e "install.packages('glue')"
RUN Rscript -e "install.packages('bsicons')"

RUN apt-get install pip -y
RUN pip install duckdb --break-system-packages

RUN Rscript -e "install.packages('duckdb')"
RUN Rscript -e "install.packages('dbplyr')"

RUN addgroup --system app && adduser --system --ingroup app app
RUN mkdir /home/app
RUN chown app:app /home/app
ENV HOME=/home/app
WORKDIR /home/app

COPY helpers.R helpers.R
COPY www www
COPY app.R app.R
RUN chown app:app -R /home/app
USER app

EXPOSE 9003

CMD ["R", "-e", "shiny::runApp('/home/app')"]

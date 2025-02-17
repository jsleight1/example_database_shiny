
example_shiny_database contains a small R shiny application with an associated duckdb database
and docker image at `docker.io/jsleight1/example_shiny_database`.

This is based on code developed for a R shiny tutorial found here: https://github.com/skaltman/outliers-app-db-r

The application can be launched using:

```
docker run -v $PWD/data:/home/app/data -p 4000:9003 -it jsleight1/example_shiny_database:R4.4.2
```

where `$PWD/data/` contains the the ozone.duckdb file in your local working environment.

Viewed at:

```
http://localhost:9000/
```

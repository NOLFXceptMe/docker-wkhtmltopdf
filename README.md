# Wkhtmltopdf Docker Container

This docker container lets you run wkhtmltopdf in a docker container.

## Building the image

```sh
docker build .
```

## Using the image

```sh 
docker run -v <host_dir>:<container_dir> nolfxceptme/wkhtmltopdf http://www.google.com <container_dir>/output.pdf
```

The mounted volume can be used to send local html files and to save the output.

## Authors and Contributors

This image is based on the work done at [Openlabs](http://www.openlabs.co.in). Original repository is [openlabs/docker-wkhtmltopdf](https://github.com/openlabs/docker-wkhtmltopdf)

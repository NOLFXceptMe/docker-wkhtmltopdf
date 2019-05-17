FROM alpine:latest
MAINTAINER Naveen Molleti <nerd.naveen@gmail.com>

# Install dependencies
RUN apk update
RUN apk add wkhtmltopdf

ENTRYPOINT ["wkhtmltopdf"]

# Show the extended help
CMD ["-h"]

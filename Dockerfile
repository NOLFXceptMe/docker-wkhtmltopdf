FROM ubuntu:16.04
MAINTAINER Naveen Molleti <nerd.naveen@gmail.com>

# Install dependencies
RUN sed 's/main$/main universe/' -i /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y build-essential xorg libssl-dev libxrender-dev wget gdebi

# Download and install wkhtmltopdf
RUN wget --no-check-certificate https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
RUN tar vxf wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
RUN cp wkhtmltox/bin/wk* /usr/local/bin/
RUN rm -rf wkhtmltox
RUN rm wkhtmltox-0.12.4_linux-generic-amd64.tar.xz

RUN apt-get -y clean && \
    apt-get -y purge && \
    rm -rf /var/lib/apt/lists/* /tmp/*

ENTRYPOINT ["wkhtmltopdf"]

# Show the extended help
CMD ["-h"]

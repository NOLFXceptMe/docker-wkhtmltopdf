FROM ubuntu:18.04
MAINTAINER Naveen Molleti <nerd.naveen@gmail.com>

# Install dependencies
RUN sed 's/main$/main universe/' -i /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y xfonts-75dpi xorg libssl-dev libxrender-dev wget gdebi

# Download and install wkhtmltopdf
RUN wget --no-check-certificate https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.bionic_amd64.deb
RUN dpkg -i wkhtmltox_0.12.5-1.bionic_amd64.deb
RUN rm wkhtmltox_0.12.5-1.bionic_amd64.deb

RUN apt-get -y clean && \
      apt-get -y purge && \
      rm -rf /var/lib/apt/lists/* /tmp/*

ENTRYPOINT ["wkhtmltopdf"]

# Show the extended help
CMD ["-h"]

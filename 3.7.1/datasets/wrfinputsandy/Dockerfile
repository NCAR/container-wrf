FROM centos:latest
MAINTAINER John Exby <exby@ucar.edu>
#
ENV WRF_VERSION 3.7.1
RUN mkdir /wrfinput
#
RUN curl -SL https://ral.ucar.edu/sites/default/files/public/projects/ncar-docker-wrf/ucar-bsd-3-clause-license.pdf > /UCAR-BSD-3-Clause-License.pdf
RUN curl -SL https://ral.ucar.edu/sites/default/files/public/projects/ncar-docker-wrf/sandydata-wrf-$WRF_VERSION.tar.gz | tar -xzC /wrfinput
#
VOLUME /wrfinput
CMD ["true"]

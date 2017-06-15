FROM centos:latest
MAINTAINER John Exby <exby@ucar.edu>
#
ENV WRF_VERSION 3.7.1
RUN mkdir /WPS_GEOG
#
RUN curl -SL https://ral.ucar.edu/sites/default/files/public/projects/ncar-docker-wrf/ucar-bsd-3-clause-license.pdf > /UCAR-BSD-3-Clause-License.pdf
RUN curl -SL https://ral.ucar.edu/sites/default/files/public/projects/ncar-docker-wrf/wpsgeogminimum-wrf-$WRF_VERSION.tar.gz | tar -xzC /WPS_GEOG
#
VOLUME /WPS_GEOG
CMD ["true"]

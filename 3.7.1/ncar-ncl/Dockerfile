#
FROM centos:latest
MAINTAINER John Exby <exby@ucar.edu>
# 
RUN yum -y update
RUN yum -y install fontconfig libgfortran libXext libXrender ImageMagick
#
RUN curl -SL https://ral.ucar.edu/sites/default/files/public/projects/ncar-docker-wrf/nclncarg-6.3.0.linuxcentos7.0x8664nodapgcc482.tar.gz | tar zxC /usr/local
#
ENV NCARG_ROOT /usr/local
#
RUN mkdir /nclscripts
COPY wrf_Precip_multi_files_convectives_pdf.ncl /nclscripts/
COPY wrf_Precip_multi_files_tendency_pdf.ncl /nclscripts/
COPY wrf_Precip_multi_files_total_pdf.ncl /nclscripts/
COPY wrf_Precip_multi_files_total_png.ncl /nclscripts/
COPY wrf_Surface_files_pdf.ncl /nclscripts/
COPY wrf_Surface_files_png.ncl /nclscripts/
COPY ncl_run_all /nclscripts/
WORKDIR /nclscripts
RUN chmod 755 ncl_run_all
CMD ["/nclscripts/ncl_run_all"]

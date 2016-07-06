#!/bin/bash
#
# Primarily used and tested on a mac os x laptop
# exby@ucar.edu
#
# Start with clean directories
rm -f ~/wrfoutput/*nc  ~/wrfoutput/*pdf ~/wrfoutput/*gif ~/wrfoutput/*png
#
# instantiate data sets and run WRF.  see corresponding docker-compose.yml file
docker-compose up
#
#
# do NCL post proc on .nc output files
docker run --rm -it -v ~/wrfoutput:/wrfoutput bigwxwrf/ncar-ncl
# docker run --rm -it -v /Users/myID/wrfoutput:/wrfoutput bigwxwrf/ncar-ncl
#
# remove WRF container processes that exited
docker-compose rm -f
#
# look at output files
#
echo 
cd ~/wrfoutput/
ls
open *.pdf *.png
open -a Safari *.gif

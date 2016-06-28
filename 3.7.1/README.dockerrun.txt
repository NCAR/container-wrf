#
# Manual steps to instantial local docker containers from your personal docker wrf images
#
docker create -v /WPS_GEOG --name wpsgeog my-wpsgeog
docker create -v /wrfinput --name wrfinputsandy my-wrfinputsandy
# or Katrina
# docker create -v /wrfinput --name wrfinputkatrina my-wrfinputkatrina
#
docker run -it --volumes-from wpsgeog --volumes-from wrfinputsandy -v ~/wrfoutput:/wrfoutput \
 --name mywrfsandy my-wrf /wrf/run-wrf
#
# below a Windows directory mapping example:
# docker run -it --volumes-from wpsgeog --volumes-from wrfinputsandy -v c:/Users/myid/wrfoutput:/wrfoutput \ 
#   --name mywrfsandy my-wrf /wrf/run-wrf
#
# Now post process the .nc files
docker run -it --rm=true -v ~/wrfoutput:/wrfoutput --name postproc my-ncl
# docker run -it --rm=true -v c:/Users/myid/wrfoutput:/wrfoutput --name postproc my-ncl
#
# A more automated method using pre-built NCAR docker-wrf container images,
# edit the docker-compose.yml file to reflect wrfoutput directory, number of cores, etc
# then
# Optional for most, perhaps required for Windows Docker beta users:  manual downloads to local system
#
#docker pull bigwxwrf/ncar-wpsgeog
#docker pull bigwxwrf/ncar-wrfinputsandy
#docker pull bigwxwrf/ncar-wrfinputkatrina
#docker pull bigwxwrf/ncar-wrf
#docker pull bigwxwrf/ncar-ncl
#
cd demos/local/
docker-compose up

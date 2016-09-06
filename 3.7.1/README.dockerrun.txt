#
# Note:  Not intended to be run on super computers or clusters where docker engine may not be running.
# these are tutorial steps for learning on a personal workstation or laptop where Docker engine
# has been installed and running.
#
#
# Optional for most, perhaps required for Windows Docker beta users:  manual downloads to local system
#docker pull bigwxwrf/ncar-wpsgeog
#docker pull bigwxwrf/ncar-wrfinputsandy
#docker pull bigwxwrf/ncar-wrfinputkatrina
#docker pull bigwxwrf/ncar-wrf
#docker pull bigwxwrf/ncar-ncl
#
#
# to simply run the demo
# using pre-built NCAR docker-wrf container images, review the docker-compose.yml file
# and
      cd demos/local/
      docker-compose up
#
# Note: docker-compose support for Windows may not be available. check Docker version and their feature notes.
# IF docker-compose is not available on your system, here are the commands to run manually:
docker create -v /WPS_GEOG --name wpsgeog bigwxwrf/ncar-wpsgeog
docker create -v /wrfinput --name wrfinputsandy bigwxwrf/ncar-wrfinputsandy
# or Katrina
# docker create -v /wrfinput --name wrfinputkatrina bigwxwrf/ncar-wrfinputkatrina
#
docker run -it --volumes-from wpsgeog --volumes-from wrfinputsandy -v ~/wrfoutput:/wrfoutput \
 --name ncarwrfsandy bigwxwrf/ncar-wrf /wrf/run-wrf
#
# below a Windows directory mapping example:
# docker run -it --volumes-from wpsgeog --volumes-from wrfinputsandy -v c:/Users/myid/wrfoutput:/wrfoutput \
#   --name ncarwrfsandy bigwxwrf/ncar-wrf /wrf/run-wrf
#
# Now post process the .nc files
docker run -it --rm=true -v ~/wrfoutput:/wrfoutput --name postproc bigwxwrf/ncar-ncl
# 
# Windows:
# docker run -it --rm=true -v c:/Users/myid/wrfoutput:/wrfoutput --name postproc ncar-ncl
#
# For manual steps to instantiate local docker containers from your personal docker wrf images
# see the file README.dockerbuild.txt

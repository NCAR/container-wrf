#
# Note:  Not intended to be run on super computers or clusters where docker engine may not be running.
# these are tutorial steps for learning on a personal workstation or laptop where Docker engine
# has been installed and running.
#
# These are manual steps to build your personal docker wrf container images.
#
# to simply run the demo:
# using pre-built NCAR docker-wrf container images, see the docker-compose.yml file
# and the file README.dockerrun.txt
#
# The steps below are NOT necessary to run the docker demo, but instead for learning how to build docker images.
#  using "Dockerfile" and commands such as "docker build -t <>"
#
git clone  https://github.com/NCAR/docker-wrf
cd ./docker-wrf/3.7.1/datasets
cd wpsgeog ; docker build -t my-wpsgeog .
cd ../wrfinputsandy ; docker build -t my-wrfinputsandy .
cd ../wrfinputkatrina ; docker build -t my-wrfinputkatrina .
cd ../../ncar-ncl ; docker build -t my-ncl .
#
# now compile wrf from source
cd ../ncar-wrf ; docker build -t my-wrf .
#
#
# The steps below are ONLY if you successfully completed all steps above cleanly.
# Manual steps to instantiate local docker containers from your personal docker wrf images follow:
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
#
# Windows:
# docker run -it --rm=true -v c:/Users/myid/wrfoutput:/wrfoutput --name postproc my-ncl
#
# A more automated method using pre-built NCAR docker-wrf container images,
# edit the docker-compose.yml file to reflect wrfoutput directory, number of cores, etc
# again, see the file README.dockerrun.txt
#

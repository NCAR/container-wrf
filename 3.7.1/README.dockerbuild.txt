#
# Manual steps to build your personal docker wrf container images
# for using pre-built NCAR docker-wrf container images, see the docker-compose.yml file
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

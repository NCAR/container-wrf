 #!/bin/bash
#
# Primarily used and tested for EC2 instance
# exby@ucar.edu
#
# edit variables here as needed
export AWS_EC2="wrf-LargeEC2"
export AWSIP=`docker-machine ip $AWS_EC2`
#
# select virtual machine are we running
eval $(docker-machine env $AWS_EC2)
#
#
# Start with clean directories
rm -rf ~/data-pulled-aws
ssh -i ~/.docker/machine/machines/$AWS_EC2/id_rsa ubuntu@$AWSIP "sudo rm -rf /home/ubuntu/wrfoutput"
#
# instantiate data sets and run WRF.  see corresponding docker-compose.yml file
docker-compose up
#
#
# do NCL post proc on .nc output files
docker run --rm -it -v /home/ubuntu/wrfoutput:/wrfoutput bigwxwrf/ncar-ncl
#
#
# transfer files from amazon back to this system
echo
mkdir ~/data-pulled-aws
scp -i ~/.docker/machine/machines/$AWS_EC2/id_rsa ubuntu@$AWSIP:/home/ubuntu/wrfoutput/* ~/data-pulled-aws/
#
#  remove WRF container processes that exited
docker-compose rm -f
#
# halt the amazon EC2 server to save $
#docker-machine stop $AWS_EC2
#
#
# look at output files
cd ~/data-pulled-aws
echo
ls
#
# the following commands only function on MacOS
# comment out or adjust for other OS platforms
open *.pdf
open *.png
open -a Safari *.gif

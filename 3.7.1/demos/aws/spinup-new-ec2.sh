#
# instead of paying a whopping $1.59 per hour for a c4.8large virtual machine, let's save money by using Spot instances!
# aws ec2 describe-spot-price-history --instance-types c4.8xlarge --availability-zone us-west-2b --start-time 2017-05-30T16:00:00 --end-time 2017-05-30T18:00:00
#
docker-machine -D create --driver amazonec2 \
--amazonec2-access-key $AWS_ACCESS_KEY_ID \
--amazonec2-secret-key $AWS_SECRET_ACCESS_KEY \
--amazonec2-vpc-id $AWS_VPC_ID \
--amazonec2-region us-west-2 \
--amazonec2-instance-type c4.8xlarge \
--amazonec2-root-size 60 \
--amazonec2-request-spot-instance \
--amazonec2-spot-price 0.625 \
--amazonec2-zone b \
wrf-LargeEC2

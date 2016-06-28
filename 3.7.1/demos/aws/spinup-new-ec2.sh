docker-machine -D create --driver amazonec2 \
--amazonec2-access-key $AWS_ACCESS_KEY_ID \
--amazonec2-secret-key $AWS_SECRET_ACCESS_KEY \
--amazonec2-vpc-id $AWS_VPC_ID \
--amazonec2-region us-west-2 \
--amazonec2-instance-type c4.8xlarge \
--amazonec2-root-size 60 \
--amazonec2-zone b wrf-LargeEC2

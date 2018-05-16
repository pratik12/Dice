#!/bin/sh
echo "helo World"
touch DeployKeyPair.pem

echo $DEPLOY_KEY_PAIR
echo $DEPLOY_KEY_PAIR > DeployKeyPair.pem
cat DeployKeyPair.pem
#chmod 400 brooklyn-ec2.pem
ssh -i DeployKeyPair.pem ec2-user@ec2-13-59-122-224.us-east-2.compute.amazonaws.com "cd Dice/bin && node www"

#!/bin/sh
echo "helo World"
chmod 400 brooklyn-ec2.pem
ssh -i "brooklyn-ec2.pem" ec2-user@ec2-13-59-122-224.us-east-2.compute.amazonaws.com "cd Dice/bin && node www"

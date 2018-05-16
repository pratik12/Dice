#!/bin/sh
echo "helo World"
ls -l /usr/bin/ssh
#rm DeployKeyPair.pem
touch DeployKeyPair.pem

echo $DEPLOY_KEY_PAIR
echo $DEPLOY_KEY_PAIR | sed -e 's/\(KEY-----\)\s/\1\n/g; s/\s\(-----END\)/\n\1/g' | sed -e '2s/\s\+/\n/g' > DeployKeyPair.pem
#cat DeployKeyPair.pem
chmod 400 DeployKeyPair.pem
ssh -i DeployKeyPair.pem ec2-user@ec2-13-59-122-224.us-east-2.compute.amazonaws.com "cd Dice/bin && node www"

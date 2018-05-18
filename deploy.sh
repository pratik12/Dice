#!/bin/sh
echo "helo World"
# should be uncommented when uploading to concourse 
# if [ ! -f DeployKeyPair.pem ]; then
#     echo "Deleting permissions file"
#     #rm DeployKeyPair.pem
# fi
touch DeployKeyPair.pem
echo $BRANCH_NAME
echo $DEPLOY_KEY_PAIR
echo $DEPLOY_KEY_PAIR | sed -e 's/\(KEY-----\)\s/\1\n/g; s/\s\(-----END\)/\n\1/g' | sed -e '2s/\s\+/\n/g' > DeployKeyPair.pem
chmod 400 DeployKeyPair.pem
ssh -o "StrictHostKeyChecking no" -i DeployKeyPair.pem ec2-user@ec2-13-59-122-224.us-east-2.compute.amazonaws.com << EOSSH
cd Dice
pm2 stop all
git pull --all
git checkout $BRANCH_NAME
git pull
git branch
cd bin
npm start
exit
EOSSH

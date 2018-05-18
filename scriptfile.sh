#!/bin/sh
echo "helo World 2"
cd
cd Dice
pm2 stop all
#git checkout $BRANCH_NAME
git pull
cd bin && npm start
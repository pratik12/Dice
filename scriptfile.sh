#!/bin/sh
echo "helo World 2"
cd
cd Dice
pm2 stop all
git pull
cd bin && npm start
#!/bin/bash
echo 'run after_install.sh: ' >> /home/ec2-user/complete-cd/deploy.log

echo 'cd /home/ec2-user/nodejs-server-cicd' >> /home/ec2-user/complete-cd/deploy.log
cd /home/ec2-user/complete-cd >> /home/ec2-user/complete-cd/deploy.log

echo 'npm install' >> /home/ec2-user/complete-cd/deploy.log 
npm install >> /home/ec2-user/complete-cd/deploy.log

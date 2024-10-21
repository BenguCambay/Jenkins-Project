#!/bin/bash
yum update -y
yum install ansible -y
yum install git -y
yum install python3 python3-pip -y
pip install boto3 botocore
cd /home/ec2-user
git clone https://github.com/BenguCambay/Jenkins-Project.git
cd Jenkins-Project
chmod 400 /home/ec2-user/Jenkins-Project/firstkey.pem
chmod +x url.sh
./url.sh

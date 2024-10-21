#!/bin/bash

# Terraform'dan public IP'yi al
PUBLIC_IP=$(terraform output -raw public_ip)

# .env dosyasına yaz
echo "PUBLIC_IP=${PUBLIC_IP}" > /home/ec2-user/Jenkins-Project/.env

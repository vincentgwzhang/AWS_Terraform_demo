#!/bin/bash
yum update -y
timedatectl set-timezone "Europe/Madrid"
localectl set-locale LANG=ES_es.UTF-8
touch /home/ec2-user/.hushlogin
chown ec2-user:ec2-user /home/ec2-user/.hushlogin

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"
unzip /tmp/awscliv2.zip  -d /tmp/awscliv2/
/tmp/awscliv2/aws/install

curl -sL https://rpm.nodesource.com/setup_18.x | bash -
yum install -y gcc-c++ make
yum install -y nodejs

yum install -y httpd
systemctl enable httpd
service httpd start  
sudo echo '<h1>Terraform EC2.</h1>' | sudo tee /var/www/html/index.html
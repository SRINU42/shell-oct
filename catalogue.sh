echo -e "\e[31  Enable NodeJs 18  \e[0"
dnf module disable nodejs -y &>>"/tmp/roboshop.log"
dnf module enable nodejs:18 -y &>>"/tmp/roboshop.log"

echo -e "\e[31  install NodeJs   \e[0"
dnf install nodejs -y &>>"/tmp/roboshop.log"

echo -e "\e[31  Adding roboshop user  \e[0"
useradd roboshop &>>"/tmp/roboshop.log" &>>"/tmp/roboshop.log"

echo -e "\e[31  setup an app directory  \e[0"
mkdir /app &>>"/tmp/roboshop.log" &>>"/tmp/roboshop.log"

echo -e "\e[31  Download the application code to created app directory  \e[0"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip  &>>"/tmp/roboshop.log"

echo -e "\e[31 created app directory  \e[0"
cd /app &>>"/tmp/roboshop.log"
unzip /tmp/catalogue.zip &>>"/tmp/roboshop.log"

echo -e "\e[31 download the dependencies   \e[0"
cd /app 
npm install &>>"/tmp/roboshop.log"

echo -e "\e[31 Setup SystemD Catalogue Service  \e[0"
cp /home/centos/shell-oct/catalogue.service /etc/systemd/system/catalogue.service &>>"/tmp/roboshop.log"

echo -e "\e[31 Start the service \e[0"
systemctl daemon-reload &>>"/tmp/roboshop.log"
systemctl enable catalogue &>>"/tmp/roboshop.log"
systemctl start catalogue &>>"/tmp/roboshop.log"

echo -e "\e[31 Config mongodb repo \e[0"
cp /home/centos/shell-oct/mongo.repo /etc/yum.repos.d/mongo.repo &>>"/tmp/roboshop.log"

echo -e "\e[31 Install MongoDb \e[0"
dnf install mongodb-org-shell -y &>>"/tmp/roboshop.log"

echo -e "\e[31 Load Master Data \e[0"
mongo --host MONGODB-SERVER-IPADDRESS </app/schema/catalogue.js
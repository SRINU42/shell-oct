echo -e "\e[36m Enable NodeJs 18  \e[0m"
dnf module disable nodejs -y &>>"/tmp/roboshop.log"
dnf module enable nodejs:18 -y &>>"/tmp/roboshop.log"

echo -e "\e[36m install NodeJs   \e[0m"
dnf install nodejs -y &>>"/tmp/roboshop.log"

echo -e "\e[36m Adding roboshop user  \e[0m"
useradd roboshop &>>"/tmp/roboshop.log" &>>"/tmp/roboshop.log"

echo -e "\e[36m setup an app directory  \e[0m"
mkdir /app &>>"/tmp/roboshop.log" &>>"/tmp/roboshop.log"

echo -e "\e[36m Download the application code to created app directory  \e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip  &>>"/tmp/roboshop.log"

echo -e "\e[36m created app directory  \e[0m"
cd /app &>>"/tmp/roboshop.log"
unzip /tmp/catalogue.zip &>>"/tmp/roboshop.log"

echo -e "\e[36m download the dependencies   \e[0m"
cd /app 
npm install &>>"/tmp/roboshop.log"

echo -e "\e[36m Setup SystemD Catalogue Service  \e[0m"
cp /home/centos/shell-oct/catalogue.service /etc/systemd/system/catalogue.service &>>"/tmp/roboshop.log"

echo -e "\e[36m Start the service \e[0m"
systemctl daemon-reload &>>"/tmp/roboshop.log"
systemctl enable catalogue &>>"/tmp/roboshop.log"
systemctl start catalogue &>>"/tmp/roboshop.log"

echo -e "\e[36m Config mongodb repo \e[0m"
cp /home/centos/shell-oct/mongo.repo /etc/yum.repos.d/mongo.repo &>>"/tmp/roboshop.log"

echo -e "\e[36m Install MongoDb \e[0m"
dnf install mongodb-org-shell -y &>>"/tmp/roboshop.log"

echo -e "\e[36m Load Master Data \e[0m"
mongo --host 172.31.17.163 </app/schema/catalogue.js

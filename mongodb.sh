
echo -e "\e[34m Config mongodb repo   \e[0m"
cp /home/centos/shell-oct/mongo.repo /etc/yum.repos.d/mongo.repo &>>"/tmp/roboshop.log"

echo -e "\e[34m  Install MongoDb  \e[0m"
dnf install mongodb-org -y &>>"/tmp/roboshop.log"

echo -e "\e[34m  Enable mangodb  \e[0m"
systemctl enable mongod &>>"/tmp/roboshop.log"
systemctl restart mongod &>>"/tmp/roboshop.log"


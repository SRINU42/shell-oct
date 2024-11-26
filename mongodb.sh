
echo -e "\e[31 Config mongodb repo   \e[0"
cp /home/centos/shell-oct/mongo.repo /etc/yum.repos.d/mongo.repo &>>"/tmp/roboshop.log"

echo -e "\e[31  Install MongoDb  \e[0"
dnf install mongodb-org -y &>>"/tmp/roboshop.log"

echo -e "\e[31  Enable mangodb  \e[0"
systemctl enable mongod &>>"/tmp/roboshop.log"
systemctl restart mongod &>>"/tmp/roboshop.log"


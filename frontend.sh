echo -e "\e[33m Installing Nginx \e[0m"
dnf install nginx -y &>>"/tmp/roboshop.log"

echo -e "\e[33m Removing index in nginx \e[0m"
rm -rf /usr/share/nginx/html/* &>>"/tmp/roboshop.log"

echo -e "\e[33m Downloading front end content \e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip &>>"/tmp/roboshop.log"

echo -e "\e[33m Extracting front end content \e[0m"
cd /usr/share/nginx/html &>>"/tmp/roboshop.log"
unzip /tmp/frontend.zip &>>"/tmp/roboshop.log"

echo -e "\e[33m config the Roboshop file  \e[0m"
cp /home/centos/shell-oct/roboshop.conf /etc/nginx/default.d/roboshop.conf &>>"/tmp/roboshop.log"


echo -e "\e[33m Enabling Nginx \e[0m"
systemctl enable nginx &>>"/tmp/roboshop.log"
systemctl restart nginx &>>"/tmp/roboshop.log"
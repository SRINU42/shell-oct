echo -e "\e[33 Installing Nginx \e[0"
dnf install nginx -y &>>"/tmp/roboshop.log"

echo -e "\e[33 Removing index in nginx \e[0"
rm -rf /usr/share/nginx/html/* &>>"/tmp/roboshop.log"

echo -e "\e[33 Downloading front end content \e[0"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip &>>"/tmp/roboshop.log"

echo -e "\e[33 Extracting front end content \e[0"
cd /usr/share/nginx/html &>>"/tmp/roboshop.log"
unzip /tmp/frontend.zip &>>"/tmp/roboshop.log"

echo -e "\e[33 config the Roboshop file  \e[0"
cp /home/centos/shell-oct/roboshop.conf /etc/nginx/default.d/roboshop.conf &>>"/tmp/roboshop.log"


echo -e "\e[33 Enabling Nginx \e[0"
systemctl enable nginx &>>"/tmp/roboshop.log"
systemctl restart nginx &>>"/tmp/roboshop.log"
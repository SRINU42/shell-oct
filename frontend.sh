echo -e "\e[31 Installing Nginx \e[0"
dnf install nginx -y 

echo -e "\e[31 Removing index in nginx \e[0"
rm -rf /usr/share/nginx/html/* 

echo -e "\e[31 Downloading front end content \e[0"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip 

echo -e "\e[31 Extracting front end content \e[0"
cd /usr/share/nginx/html 
unzip /tmp/frontend.zip

echo -e "\e[31 config the Roboshop file  \e[0"
cp /home/centos/shell-oct/roboshop.conf /etc/nginx/default.d/roboshop.conf


echo -e "\e[31 Enabling Nginx \e[0"
systemctl enable nginx 
systemctl restart nginx 
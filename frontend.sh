source common.sh

component=frontend


echo -e "${color} install niginx ${nocolor}"
yum install nginx -y &>>${log_file}
stat_check $?

echo -e "${color} removie content ${nocolor}"
rm -rf /usr/share/nginx/html/* &>>${log_file}
stat_check $?

echo -e "${color} uploading the content ${nocolor}"
curl -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}.zip &>>${log_file}
stat_check $?

echo -e "${color} unzip the frontenf content ${nocolor}"
cd /usr/share/nginx/html &>>${log_file}
unzip /tmp/${component}.zip &>>${log_file}
stat_check $?

echo -e "${color} Config the Roboshop file ${nocolor}"
cp /home/centos/shell-oct/roboshop.conf /etc/nginx/default.d/roboshop.conf 
stat_check $?

echo -e "${color} systemd start ${nocolor}"
systemctl enable nginx &>>${log_file}
systemctl restart nginx &>>${log_file}
stat_check $?
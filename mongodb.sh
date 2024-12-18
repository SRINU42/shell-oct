
source common.sh

echo -e "${color} mongodb repo file  ${nocolor}"
cp /home/centos/shell-oct/mongodb.repo /etc/yum.repos.d/mongodb.repo 
stat_check $?

echo -e "${color} install mongodb ${nocolor}"
yum install mongodb-org -y &>>${log_file}
stat_check $?

echo -e "${color} Update MongoDB Listen Address ${nocolor}"
sed -i 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf &>>${log_file}
stat_check $?

echo -e "${color} SystemD start  ${nocolor}"
systemctl enable mongod &>>${log_file}
systemctl restart mongod &>>${log_file}
stat_check $?


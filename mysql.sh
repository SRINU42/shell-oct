source common.sh
component=mysql

echo -e "${color} Disable the ${component}   ${nocolor}"
yum module disable ${component} -y &>>${log_file}
stat_check $?

echo -e "${color} Copy the repo file  ${nocolor}"
cp /home/centos/shell-oct/${component}.repo /etc/yum.repos.d/${component}.repo &>>${log_file}
stat_check $?

echo -e "${color} Installing the ${component} servier  ${nocolor}"
yum install ${component}-community-server -y &>>${log_file}
stat_check $?

echo -e "${color} start the ${component} service ${nocolor}"
systemctl enable mysqld &>>${log_file}
systemctl restart mysqld  &>>${log_file}
stat_check $?

echo -e "${color} Setup the Password  ${nocolor}"
mysql_secure_installation --set-root-pass $1 &>>${log_file}
stat_check $?

echo -e "${color} Setup the Password  ${nocolor}"
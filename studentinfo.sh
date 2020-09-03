#!/bin/bash

user='root'
pass=''
port='3306'
host='localhost'
db='students'

mysql -u$user -p$pass -P$port -h$host -D$db <<EOF

insert into studentinfo (studentid, fname, lname, major, semester ) values ('0', "$fname", "$lname", "$major", "$sem")

EOF


sid=$(mysql -u$user -p$pass -P$port -h$host -D$db -se "select max(studentid) from studentinfo")


mysql -u$user -p$pass -P$port -h$host -D$db <<EOF

insert into scores (scoreid, studentid, course1name, c1totals, c1grade, course2name, c2totals, c2grade, course3name, c3totals, c3grade, course4name, c4totals, c4grade, gpa) values ('0', "$sid", "$c1", null, null, "$c2", null, null, "$c3", null, null, "$c4", null, null, null)
  
EOF

echo 'Script successfully executed' 

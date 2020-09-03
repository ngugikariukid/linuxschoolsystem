#!/bin/bash
user='root'
pass=''
port='3306'
host='localhost'
db='students'

if [ $c1total -ge 90 ]
then grade1="A"
scale1=4

elif [ $c1total -ge 80 ]
then grade1="B"
scale1=3.3

elif [ $c1total -ge 70 ]
then grade1="C"
scale1=2.3

elif [ $c1total -ge 60 ]
then grade1="D"
scale1=1.3

elif [ $c1total -ge 50 ]
then grade1="E"
scale1=0.3

else grade1="F"
scale1=0

fi

if [ $c2total -ge 90 ]
then grade2="A"
scale2=4

elif [ $c2total -ge 80 ]
then grade2="B"
scale2=3.3

elif [ $c2total -ge 70 ]
then grade2="C"
scale2=2.3

elif [ $c2total -ge 60 ]
then grade2="D"
scale2=1.3

elif [ $c2total -ge 50 ]
then grade2="E"
scale2=0.3

else grade2="F"
scale2=0

fi
                
if [ $c3total -ge 90 ]
then grade3="A"
scale3=4

elif [ $c3total -ge 80 ]
then grade3="B"
scale3=3.3

elif [ $c3total -ge 70 ]
then grade3="C"
scale3=2.3

elif [ $c3total -ge 60 ]
then grade3="D"
scale3=1.3

elif [ $c3total -ge 50 ]
then grade3="E"
scale3=0.3

else grade3="F"
scale3=0

fi

if [ $c4total -ge 90 ]
then grade4="A"
scale4=4

elif [ $c4total -ge 80 ]
then grade4="B"
scale4=3.3

elif [ $c4total -ge 70 ]
then grade4="C"
scale4=2.3

elif [ $c4total -ge 60 ]
then grade4="D"
scale4=1.3

elif [ $c4total -ge 50 ]
then grade4="E"
scale4=0.3

else grade4="F"
scale4=0

fi

scaletotals=`echo $scale1 $scale2 $scale3 $scale4 | awk '{print $1 + $2 + $3 + $4}'`

gpa=`awk "BEGIN {print $scaletotals/4}"`


sid=$(mysql -u$user -p$pass -P$port -h$host -D$db -se "select max(scoreid) from scores")

mysql -u$user -p$pass -P$port -h$host -D$db <<EOF
update scores set c1grade="$grade1", c2grade="$grade2", c3grade="$grade3", c4grade="$grade4", gpa="$gpa" where scoreid="$sid"
EOF





























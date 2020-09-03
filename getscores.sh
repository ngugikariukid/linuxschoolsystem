#!/bin/bash

user='root'
pass=''
port='3306'
host='localhost'
db='students'

sid=$(mysql -u$user -p$pass -P$port -h$host -D$db -se "select max(scoreid) from scores")

export sid
./postgrades.sh

course1=$(mysql -u$user -p$pass -P$port -h$host -D$db -se "select course1name, from scores where scoreid="$sid"")

course2=$(mysql -u$user -p$pass -P$port -h$host -D$db -se "select course2name, from scores where scoreid="$sid"")

course3=$(mysql -u$user -p$pass -P$port -h$host -D$db -se "select course3name, from scores where scoreid="$sid"")

course4=$(mysql -u$user -p$pass -P$port -h$host -D$db -se "select course4name, from scores where scoreid="$sid"")

echo \n Entering Marks for $course1

while :
do
    echo "Enter marks for Quiz: (/20) "
    read c1quiz
    if [ $c1quiz -lt 0 ] || [ $c1quiz -gt 20 ]
    then  
        echo "Quiz cannot be greater that 20 or less than 0. Try again."
          
    else 
        break
    fi
done         
export c1quiz
./postgrades.sh
while :
do
    echo "Enter marks for mid semester: (/30) "
    read c1mid

    if [ $c1mid -lt 0 ] || [ $c1mid -gt 30 ]
    then  
        echo "Mid semester cannot be greater that 30 or less than 0. Try again."
          
    else 
        break
    fi
done
         
export c1mid
./postgrades.sh
      
while :
do
    echo "Enter marks for end semester: "
    read c1end

    if [ $c1end -lt 0 ] || [ $c1end -gt 50 ]
    then
        echo "End semester cannot be greater that 50 or less than 0. Try again."

    else
        break
    fi
done
c1total=`expr $c1quiz + $c1mid + $c1end`

export c1end
./postgrades.sh

export c1total
./grade1.sh


echo \n Entering Marks for $course2

while :
do
    echo "Enter marks for Quiz: (/20) "
    read c2quiz
    if [ $c2quiz -lt 0 ] || [ $c2quiz -gt 20 ]
    then
        echo "Quiz cannot be greater that 20 or less than 0. Try again."

    else
        break
    fi
done
export c2quiz
./postgrades.sh

while :
do
    echo "Enter marks for mid semester: (/30) "
    read c2mid

    if [ $c2mid -lt 0 ] || [ $c2mid -gt 30 ]
    then
        echo "Mid semester cannot be greater that 30 or less than 0. Try again."

    else
        break
    fi
done
export c2mid
./postgrades.sh
while :
do
    echo "Enter marks for end semester: "
    read c2end

    if [ $c2end -lt 0 ] || [ $c2end -gt 50 ]
    then
        echo "End semester cannot be greater that 50 or less than 0. Try again."

    else
        break
    fi
done
export c2end
./postgrades.sh
c2total=`expr $c2quiz + $c2mid + $c2end`

export c2total
./grade2.sh

echo \n Entering Marks for $course3

while :
do
    echo "Enter marks for Quiz: (/20) "
    read c3quiz
    if [ $c3quiz -lt 0 ] || [ $c3quiz -gt 20 ]
    then
        echo "Quiz cannot be greater that 20 or less than 0. Try again."

    else
        break
    fi
done
export c3quiz
./postgrades.sh

while :
do
    echo "Enter marks for mid semester: (/30) "
    read c3mid

    if [ $c3mid -lt 0 ] || [ $c3mid -gt 30 ]
    then
        echo "Mid semester cannot be greater that 30 or less than 0. Try again."

    else
        break
    fi
done

export c3mid
./postgrades.sh

while :
do
    echo "Enter marks for end semester: "
    read c3end

    if [ $c3end -lt 0 ] || [ $c3end -gt 50 ]
    then
        echo "End semester cannot be greater that 50 or less than 0. Try again."

    else
        break
    fi
done

export c3end
./postgrades.sh

c3total=`expr $c3quiz + $c3mid + $c3end`

export c3total
./grade3.sh

echo \n Entering Marks for $course4

while :
do
    echo "Enter marks for Quiz: (/20) "
    read c4quiz
    if [ $c4quiz -lt 0 ] || [ $c4quiz -gt 20 ]
    then
        echo "Quiz cannot be greater that 20 or less than 0. Try again."

    else
        break
    fi
done
export c4quiz
./postgrades.sh
while :
do
    echo "Enter marks for mid semester: (/30) "
    read c4mid

    if [ $c4mid -lt 0 ] || [ $c4mid -gt 30 ]
    then
        echo "Mid semester cannot be greater that 30 or less than 0. Try again."

    else
        break
    fi
done
export c4mid
./postgrades.sh
while :
do
    echo "Enter marks for end semester: "
    read c4end

    if [ $c4end -lt 0 ] || [ $c4end -gt 50 ]
    then
        echo "End semester cannot be greater that 50 or less than 0. Try again."

    else
        break
    fi
done
export c4end
./postgrades.sh

c4total=`expr $c4quiz + $c4mid + $c4end`

export c4total
./grade4.sh


mysql -u$user -p$pass -P$port -h$host -D$db <<EOF

update scores set c1totals = "$c1total", c2totals="$c2total", c3totals="$c3total", c4totals="$c4total" where scoreid="$sid"

EOF

std=$(mysql -u$user -p$pass -P$port -h$host -D$db -se "select max(studentid) from studentinfo")

mysql -u$user -p$pass -P$port -h$host -D$db <<EOF

insert into scoresdetails (id, studentid, course1name, c1quiz, c1mid, c1end, course2name, c2quiz, c2mid, c2end, course3name, c3quiz, c3mid, c3end, course4name, c4quiz, c4mid, c4end) values ('0', "$std", "$course1","$c1quiz","$c1mid","$c1end", "$course2","$c2quiz","$c2mid","$c2end", "$course3","$c3quiz","$c3mid","$c3end", "$course4", "$c4quiz","$c4mid","$c4end")

EOF





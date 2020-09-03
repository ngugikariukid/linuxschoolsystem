#!/bin/bash
user='root'
pass=''
port='3306'
host='localhost'
db='students'

echo WELCOME
echo SELECT ONE OF BELOW
echo 1. Enter students details
echo 2. Enter student marks
echo 3. All students report
echo 4. Student with courses and GPA report
read input

case $input in
1)
read -p "Enter first name of student: " fname
read -p "Enter last name of student: " lname
read -p "Enter the major of the student: " major
read -p "Enter the semester of the student: " sem
read -p "Enter course 1 of student: " c1
read -p "Enter course 2 of student: " c2
read -p "Enter course 3 of student: " c3
read -p "Enter course 4 of student: " c4

export fname
export lname
export major
export sem
export c1
export c2
export c3
export c4

./studentinfo.sh
;;

2)

sid=$(mysql -u$user -p$pass -P$port -h$host -D$db -se "select max(scoreid) from scores")

course1=$(mysql -u$user -p$pass -P$port -h$host -D$db -se "select course1name from scores where scoreid="$sid"")

course2=$(mysql -u$user -p$pass -P$port -h$host -D$db -se "select course2name from scores where scoreid="$sid"")

course3=$(mysql -u$user -p$pass -P$port -h$host -D$db -se "select course3name from scores where scoreid="$sid"")

course4=$(mysql -u$user -p$pass -P$port -h$host -D$db -se "select course4name from scores where scoreid="$sid"")

echo  Entering Marks for $course1

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

echo Entering Marks for $course2

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
c2total=`expr $c2quiz + $c2mid + $c2end`

echo  Entering Marks for $course3

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

c3total=`expr $c3quiz + $c3mid + $c3end`

echo Entering Marks for $course4

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

c4total=`expr $c4quiz + $c4mid + $c4end`


export c1total
export c2total
export c3total
export c4total
./grading.sh


mysql -u$user -p$pass -P$port -h$host -D$db <<EOF

update scores set c1totals = "$c1total", c2totals="$c2total", c3totals="$c3total", c4totals="$c4total" where scoreid="$sid"

EOF

std=$(mysql -u$user -p$pass -P$port -h$host -D$db -se "select max(studentid) from studentinfo")

mysql -u$user -p$pass -P$port -h$host -D$db <<EOF

insert into scoresdetails (id, scoreid, course1name, c1quiz, c1mid, c1end, course2name, c2quiz, c2mid, c2end, course3name, c3quiz, c3mid, c3end, course4name, c4quiz, c4mid, c4end) values ('0', "$sid", "$course1","$c1quiz","$c1mid","$c1end", "$course2","$c2quiz","$c2mid","$c2end", "$course3","$c3quiz","$c3mid","$c3end", "$course4", "$c4quiz","$c4mid","$c4end")

EOF

echo "Task completed successfully"

;;

3)

mysql -u$user -p$pass -P$port -h$host -D$db <<EOF
select * from studentinfo
EOF
echo "Student info extracted"

;;

4)

mysql -u$user -p$pass -P$port -h$host -D$db <<EOF

select scores.studentid, studentinfo.fname, studentinfo.lname, studentinfo.major, scores.gpa from scores inner join studentinfo on scores.studentid=studentinfo.studentid;
EOF

echo "Successful"

;;



*)
echo Invalid input. Try again.

esac

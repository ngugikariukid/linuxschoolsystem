#! /bin/bash

while :
do
    echo "Enter midsem: /30 "
    read mid

    if [ $mid -lt 0 ] || [ $mid -gt 30 ]
    then
        echo "Mid semester cannot be greater that 30 or less than 0. Try again."
       
    else
        break
    fi
done

while :
do
    echo "Enter quiz: /20 "
    read quiz

    if [ $quiz -lt 0 ] || [ $quiz -gt 20 ]
    then  
        echo "Quiz cannot be greater that 20 or less than 0. Try again."
          
    else 
        break
    fi
done         
      
while :
do
    echo "Enter end sem: /50 "
    read end

    if [ $end -lt 0 ] || [ $end -gt 50 ]
    then  
        echo "End semester cannot be greater that 500 or less than 0. Try again."
          
    else 
        break
    fi
done         
      
echo mid sem is $mid
echo end is $end
echo quiz is $quiz

total=`expr $mid + $end + $quiz`
echo Totals is $total

export total 
./try2.sh







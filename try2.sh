#!/bin/bash

echo this is try2.sh communicating


if [ $total -ge 90 ] 
then grade="A"
scale=4

elif [ $total -ge 80 ]
then grade="B"
scale=3.3


elif [ $total -ge 70 ]
then grade="C"

elif [ $total -ge 60 ]
then grade="D"

elif [ $total -ge 50 ]
then grade="E"

else grade="F"

fi

echo grade from try2.sh is $grade
export grade
export scale
./try3.sh


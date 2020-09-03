#!/bin/bash

echo this is script try3.sh communicating

echo exported value from try2.sh is $grade
echo scale is $scale

scale2=3.4
scale3=2
scale4=3.3


scalet=`echo $scale $scale2 $scale3 $scale4 | awk '{print $1 + $2 + $3 + $4}'`

gpa=`awk "BEGIN {print $scalet/4}"`

echo Scale total is $scalet
echo GPA is $gpa

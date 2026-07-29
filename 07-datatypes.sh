#1/bin/bash
NUM1=10
NUM2=20
SUM=$(($NUM1+$NUM2))

# Array

MOVIES=("RRR" "OG" "SALAR")

echo ${MOVIES[@]} # it will display all names 
echo $SUM
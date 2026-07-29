#!/bin/bash

echo "All variabls are: $@"
echo "No of variables passed: $#"
echo "First variable: $1"
echo "Script Name: $0"
echo "who is running user Name: $USER"
echo "Which directory: $PWD"
echo "Home directory: $HOME"
echo "PID of the current script: $$"
sleep 5 &
echo "PID of background command: $!"
wait $!
lno=$LINENO
echo "Line number: $lno"
echo "Executed in $SECONDS seconds"
echo "random NUmber: $RANDOM" 
a
echo "Exit  code of previuos command :$?"
name="amireddy ravi"
echo "display nmae : $name"
#!/bin/bash

dpkg -s mongod &> /dev/null

if [ $? -eq 0 ]; then
    echo "Package mongod is installed!"
else
    echo "Package mongod is NOT installed!"
fi

dpkg -s npm &> /dev/null

if [ $? -eq 0 ]; then
    echo "Package npm is installed!"
else
    echo "Package npm is NOT installed!"
fi

dpkg -s nginx &> /dev/null

if [ $? -eq 0 ]; then
    echo "Package nginx is installed!"
else
    echo "Package nginx is NOT installed!"
fi

dpkg -s nodejs &> /dev/null

if [ $? -eq 0 ]; then
    echo "Package nodejs is installed!"
else
    echo "Package nodejs is NOT installed!"
fi

dpkg -s git &> /dev/null

if [ $? -eq 0 ]; then
    echo "Package git is installed!"
else
    echo "Package git is NOT installed!"
fi

dpkg -s erl  &> /dev/null

if [ $? -eq 0 ]; then
    echo "Package erl is installed!"
else
    echo "Package erl is NOT installed!"
fi








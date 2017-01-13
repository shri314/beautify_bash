#!/bin/bash

CASES=1

describe()
{
   echo "here docs"
}

input1()
{
   cat <<"EOM"
                  cat <<"HEHE"
                     if [
                        then

HEHEFOOLER
   HEHE
                     if [ $? -eq 1 ]
                        then
HEHE
if [ $? -eq 0 ]
   then
   :
                        fi
EOM
}

expected1()
{
   cat <<"EOM"
cat <<"HEHE"
                     if [
                        then

HEHEFOOLER
   HEHE
                     if [ $? -eq 1 ]
                        then
HEHE
if [ $? -eq 0 ]
then
   :
fi
EOM
}

#!/bin/bash

CASES=1

describe()
{
   echo "Basic if then else"
}

input1()
{
   cat <<"EOM"
echo
if [ $? -eq 0 ]
   then
         echo
               else
                  echo
                        fi
EOM
}

expected1()
{
   cat <<"EOM"
echo
if [ $? -eq 0 ]
then
   echo
else
   echo
fi
EOM
}

#!/bin/bash

# simple if then else case
TEST1_in()
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

TEST1_expected()
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

# here docs
TEST2_in()
{
   cat <<"EOM"
                  cat <<"HEHE"
                     if [
                        then

HEHE
if [ $? -eq 0 ]
   then
   :
                        fi
EOM
}

TEST2_expected()
{
   cat <<"EOM"
cat <<"HEHE"
                     if [
                        then

HEHE
if [ $? -eq 0 ]
then
   :
fi
EOM
}

# elif
TEST3_in()
{
   cat <<"EOM"
if [ $? -eq 0 ]
then
   :
   elif [ $? -ne 0 ]
      then
         :
fi
EOM
}

TEST3_expected()
{
   cat <<"EOM"
if [ $? -eq 0 ]
then
   :
elif [ $? -ne 0 ]
then
   :
fi
EOM
}

N=3
for (( i = 1 ; i <= $N ; ++i ))
do
   if diff <(TEST${i}_in | python ./beautify_bash.py -t3 - ) <(TEST${i}_expected)
   then
      echo "TEST - $i of $N - PASS"
   else
      echo "TEST - $i of $N - FAIL"
   fi
done

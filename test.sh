#!/bin/bash

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

diff <(TEST1_in | python ./beautify_bash.py -t3 -          ) <(TEST1_expected) && echo PASS

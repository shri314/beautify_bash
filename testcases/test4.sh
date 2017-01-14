#!/bin/bash

CASES=1

describe()
{
   echo "string literals"
}

input1()
{
   cat <<"EOM"
func() {
                X1="This is a 'test' about quotes"
          X2='This is a "test" about quotes'
             Y1="This          
               is a 'te   
               quotes"  
            Y2='This   
               is a "te   
               quotes'   
}
EOM
}

expected1()
{
   cat <<"EOM"
func() {
   X1="This is a 'test' about quotes"
   X2='This is a "test" about quotes'
   Y1="This          
               is a 'te   
               quotes"
   Y2='This   
               is a "te   
               quotes'
}
EOM
}

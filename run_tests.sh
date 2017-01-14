#!/bin/bash

ALL_TESTS=( $(echo ./testcases/*.sh) )
TOTAL_TESTS=${#ALL_TESTS[@]};

for (( i = 0 ; i < $TOTAL_TESTS; ++i ))
do
   test_file=${ALL_TESTS[$i]}
   test_name="$(basename $test_file)"

   e=0;
   (
      CASES=1
      source $test_file

      echo "============================================================="
      echo "TEST $test_name ($i of $TOTAL_TESTS): $(describe)"

      e=0;
      for (( cc = 1 ; cc <= $CASES ; ++cc ))
      do
         (
            e=0;
            diff <(input$cc | python ./beautify_bash.py -t3 - ) <(expected$cc) || e=1

            status=PASS && [ $e -ne 0 ] && status=FAIL
            echo "   CASE $cc of $CASES - $status"
            exit $le;
         ) || ((++e))
      done

      exit $e;
   ) || ((++e))

   status=PASS && [ $e -ne 0 ] && status=FAIL
   echo
   echo "TEST $test_name ($i of $TOTAL_TESTS): $status"
   echo "============================================================="
done

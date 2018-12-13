#!/bin/bash

declare -a filenames=("\"10000\u0020Sales\u0020Records.csv\"");
#"\"1000\u0020Sales\u0020Records.csv\""
#"\"5000\u0020Sales\u0020Records.csv\""
#"\"10000\u0020Sales\u0020Records.csv\""
#"\"50000\u0020Sales\u0020Records.csv\""
#"\"100000\u0020Sales\u0020Records.csv\""
#"\"500000\u0020Sales\u0020Records.csv\""
#"\"1000000\u0020Sales\u0020Records.csv\""
#"\"1500000\u0020Sales\u0020Records.csv\"");

outer=1             # Set outer loop counter.

# Beginning of outer loop.
  printf '%s\n'run elapsedTime_api elapsedTime_cli | paste -sd ',' >> Results_Seq_Transform.csv
for ((i=1;i<=10;i++)); 
do
  echo "Pass $i" >> SequentialTestOutput.txt
  echo "---------------------" >> SequentialTestOutput.txt

  #for j in "${filenames[@]}"
  #do
    echo "loading data of file $i"  >> SequentialTestOutput.txt
    filename=`echo "\"10000\u0020Sales\u0020Records.csv\"" | sed 's/.\(.*\)/\1/' | sed 's/\(.*\)./\1/'`
    ./callservice_Load.sh $filename $i
    #echo "sleeping for 45 min"  >> SequentialTestOutput.txt
    #sleep 45m
  #done  
  
done               
# End of outer loop.

exit 0


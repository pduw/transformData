#!/bin/bash

# JSON object to pass to Lambda Function

json={"\"filename\"":"\"$1\",\"bucketname\"":\"test.bucket.562.pjd\",\"param2\"":2,\"param3\"":3}
#json={"\"filename\"":"\"newsales.csv\",\"bucketname\"":\"test.bucket.562.firsttest\",\"param2\"":2,\"param3\"":3}

#echo "Invoking Lambda function using API Gateway"  >> SequentialTestOutput.txt
#start_time="$(date -u +%s.%N)"
#echo "start time : $start_time" >> SequentialTestOutput.txt
#time output=`curl -s -H "Content-Type: application/json" -X POST -d  $json https://ffs385ccr0.execute-api.us-east-2.amazonaws.com/loadCSV_dev`

#echo ""
#echo "CURL RESULT:"  >> SequentialTestOutput.txt
#echo $output >> SequentialTestOutput.txt
#end_time="$(date -u +%s.%N)"
#elapsed_api="$(bc <<<"$end_time-$start_time")"
#echo "Total of $elapsed_api seconds elapsed for process through API gateway"  >> SequentialTestOutput.txt
#echo ""
#echo ""

#echo "sleeping for 45 min"  >> SequentialTestOutput.txt
#sleep 45m

echo "Invoking Lambda function using AWS CLI"  >> SequentialTestOutput.txt
start_time="$(date -u +%s.%N)"
echo "start time : $start_time" >> SequentialTestOutput.txt
time output=`aws lambda invoke --invocation-type RequestResponse --function-name transformcsv--region us-east-1 --payload $json /dev/stdout | head -n 1 | head -c -2 ; echo`
echo ""
echo "AWS CLI RESULT:"  >> SequentialTestOutput.txt
echo $output  >> SequentialTestOutput.txt
end_time="$(date -u +%s.%N)"
elapsed="$(bc <<<"$end_time-$start_time")"
echo "Total of $elapsed seconds elapsed for process through AWS CLI"  >> SequentialTestOutput.txt
printf '%s\n'$2 $elapsed_api $elapsed | paste -sd ',' >> Results_Seq_Transform.csv
echo ""



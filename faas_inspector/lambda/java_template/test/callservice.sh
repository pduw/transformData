#!/bin/bash

# JSON object to pass to Lambda Function
json={"\"bucketname\"":"\"test.bucket.562.pjd\"","\"filename\"":"\"100\u0020Sales\u0020Records.csv\""}
#json={"\"bucketname\"":"\"test.bucket.562.pjd\"","\"filename\"":"\"sales.csv\""}
#echo "Invoking Lambda function using API Gateway"
#time output=`curl -s -H "Content-Type: application/json" -X POST -d  $json  https://n4vd3g21ed.execute-api.us-east-1.amazonaws.com/createcsv_dev`

#echo ""
#echo "CURL RESULT:"
#echo $output
#echo ""
#echo ""

echo "Invoking Lambda function using AWS CLI"
time output=`aws lambda invoke --invocation-type RequestResponse --function-name transformcsv --region us-east-1 --payload $json /dev/stdout | head -n 1 | head -c -2 ; echo`
echo ""
echo "AWS CLI RESULT:"
echo $output
echo ""








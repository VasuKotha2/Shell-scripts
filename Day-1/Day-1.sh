#1
echo $(date)

#2
for i in {1..10}
do 
echo $(date)
sleep 1
done

#3
for i in {1..10}
do 
echo $(date) | awk -F " " '{print $1}' 
sleep 1
done

#4
for i in {1..10}
do 
echo $(date) | awk -F " " '{print $1,$2,$3,$4}' 
sleep 1
done

#5
SG='DevsecOps'
echo $SG

SG="DevsecOps"
echo $SG

#6
x=10
SG='DevSecOps-$x'
echo $SG

x=10
SG="DevSecOps-$x"
echo $SG

#7

aws s3 ls 
# Above command gives all the buckets in a region

aws s3 ls | cut -d " " -f 1
aws s3 ls | cut -d " " -f 2
aws s3 ls | cut -d " " -f 3


aws s3 ls | cut -d " " -f 2 > text.logs
aws s3 ls | cut -d " " -f 3 > buckets.txt

aws s3 ls | cut -d " " -f 1,2,3

aws s3 ls | awk -F " " '{print $1}'
aws s3 ls | awk -F " " '{print $3,$2,$1}'

aws s3 ls | cut -d ' ' -f 3 | grep -i www.
aws s3 ls | cut -d ' ' -f 3 | grep -E -i www[.]
aws s3 ls | cut -d ' ' -f 3 | grep -E -i www[-]


#8
sudo vi script.sh

#!/bin/bash

set -x # for debugging
aws s3 ls | cut -d ' ' -f 3 | grep -E www[.]
echo 'Hello vasu welcome to DevSecOps'

chmod 700 script.sh
./script.sh





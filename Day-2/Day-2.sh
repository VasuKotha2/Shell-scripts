# Passing parameters
aws ec2 describe-vpcs --region us-east-1

aws ec2 describe-vpcs --region us-east-1 | jq ".Vpcs[].VpcId" -r # -r is used to delete the double quotes(")
aws ec2 describe-vpcs --region us-east-1 | jq ".Vpcs[].VpcId" | tr -d '"' tr '[:lower:]' '[:upper]'

# script to automate
#!/bin/bash
REGION = 'us-east-1'
aws ec2 describe-vpcs --region ${REGION} | jq ".Vpcs[].VpcId" -r


# $0 is used to get the script name
# $1 is used to pass the first argument to the script
# $2 is used to pass the second argument to the script
# $3 is used to pass the third argument to the script

# Special parameters in shell scripting
# Summary Table of Special Parameters
Special Parameter	Description
$0	                Name of the script or command
$#	                Number of arguments passed
$@          	    All arguments passed, preserving quotes
$*          	    All arguments passed, not preserving quotes
$1, $2, ...     	Positional parameters (first, second, etc. arguments)
$?	                Exit status of the last command
$$	                PID of the current shell or script
$!	                PID of the last background command
$-	                Current shell options/flags
$_	                Last argument of the previous command
"$*"                All arguments passed to the script will be treated as seperate
'$*'                All arguments passed to the script will be treated as same

#1
#!/bin/bash
echo $0
echo $1
echo $2
echo $3

#2
sudo vi getVPCs.sh
#!/bin/bash
REGION = $1 #$1 is used to pass the first argument to the script
aws ec2 describe-vpcs --region ${REGION} | jq ".Vpcs[].VpcId" -r

bash getVPCs.sh


# example for $?
# /dev/null is used to suppress the command not found errors. Whatever you write into this file it will not save it will just discard

#3
#!/bin/bash
awd --version > /dev/null
if[ $? -eq 0 ]; then
    REGION = $1
    aws ec2 describe-vpcs --region ${REGION} | jq ".Vpcs[].VpcId" -r
else
    echo 'incorrect command'
fi

#4
# $@ example
sudo vi getVPCs.sh
#!/bin/bash
aws --version
if [ $? -eq 0 ]; then
    REGIONS = $@
    for REGION in ${REGIONS}; do 
        aws ec2 describe-vpcs --region ${REGION} | jq ".Vpcs[].VpcId" -r
    done
else 
    "incorrect command"
fi

bash getVPCs.sh

#5
# $# -- used to give the number of arguments to a script
#!/bin/bash
aws --version
if [ $? -eq 0 ]; then
    REGIONS = $@
    for REGION in ${REGIONS}; do 
        aws ec2 describe-vpcs --region ${REGION} | jq ".Vpcs[].VpcId" -r
    done
else 
    "incorrect command"
fi
echo $#

bash getVPCs.sh us-east-1 us-east-2 us-west-2 # it will give give 3 as no of arguments

#6

#!/bin/bash
if [ $# -gt 0 ]; then
do
aws --version
if [ $? -eq 0 ]; then
    REGIONS = $@
    for REGION in ${REGIONS}; do 
        aws ec2 describe-vpcs --region ${REGION} | jq ".Vpcs[].VpcId" -r
    done
else 
    "incorrect command"
fi
echo $#
else
    echo "Please enter atleast one argument"
fi 

bash getVPCs.sh us-east-1 us-east-2 us-west-2 # it will give give 3 as no of arguments















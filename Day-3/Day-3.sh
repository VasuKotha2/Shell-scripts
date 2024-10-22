# Output redirection

ls -al
saikiran
df -h
avinash
free
saikiran
cat /etc/hostname
saikiran

bash script.sh 2> /dev/null
bash script.sh 1> /dev/null

bash script.sh > /tmp/error1 2>&1 # if you run 5 times previous previous data will be overwritten
cat cd /tmp/error1 

bash script.sh > /tmp/error1 2>&1 # if you run 5 times previous previous data will not be overwritten
cat cd /tmp/error1 

bash script.sh | tee /tmp/tee01 # print on the screen and store it in the tmp location

#!/bin/bash
for i in {1..100}
do
echo $i
done


sudo vi even.sh

#!/bin/bash
for i in {1..100}; do
    if [ $((i%2)) -eq 0 ]; then
        echo "$i is an even number" 
    else 
        echo "$i is an odd number"
    fi
done

bash even.sh





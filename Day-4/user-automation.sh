# 1. Check the username and if the user doesn't exist then create the user

#!/bin/bash
if [ $# -gt 0 ]; then
    USER = $1
    echo $USER
    EXISTING_USER = $(cat /etc/passwd | grep -i -w $USER | cut -d ":" -f1)
    if [ "$(USER)" = "$(EXISTING_USER)" ]; then
        echo "The ${USER} you have entered is already present in the machine, Please Enter another User name"
    
    else
        echo "$USER is not present in machine, lets create a new username"
        sudo useradd -m $USER --shell /bin/bash 
    fi
else 
    echo "Please enter the valid parameter" 
fi

#2. Create random password with special chars

#!/bin/bash
if [ $# -gt 0 ]; then
    USER = $1
    echo $USER
    EXISTING_USER = $(cat /etc/passwd | grep -i -w $USER | cut -d ":" -f1)
    if [ "$(USER)" = "$(EXISTING_USER)" ]; then
        echo "The ${USER} you have entered is already present in the machine, Please Enter another User name"
    
    else
        echo "Lets create a New username"
        sudo useradd -m $USER --shell /bin/bash
        SPEC = $(echo '!@#$%^&*()_' | fold -w1 | shuf | head -1)
        PASSWORD = "DevSecOps@${RANDOM}${SPEC}"
        echo "$USER:$PASSWORD" | sudo chpasswd
        echo "The temporary password for the ${USER} is ${PASSWORD}"
        passwd -e ${USER}
        
    fi
else 
    echo "Please enter the valid parameter" 
fi


#2. Create random password with special chars for multiple users
#!/bin/bash
if [ $# -gt 0 ]; then
    
    for USER in $@; do
    echo $USER
    EXISTING_USER = $(cat /etc/passwd | grep -i -w $USER | cut -d ":" -f1)
        if [ "$(USER)" = "$(EXISTING_USER)" ]; then
            echo "The ${USER} you have entered is already present in the machine, Please Enter another User name"
    
        else
            echo "Lets create a New username"
            sudo useradd -m $USER --shell /bin/bash
            SPEC = $(echo '!@#$%^&*()_' | fold -w1 | shuf | head -1)
            PASSWORD = "DevSecOps@${RANDOM}${SPEC}"
            echo "$USER:$PASSWORD" | sudo chpasswd
            echo "The temporary password for the ${USER} is ${PASSWORD}"
            passwd -e ${USER}
        
        fi
    done
else 
    echo "Please enter the valid parameter" 
fi

#3. Force the user to reset the password during first time login

sed -i "58s s/.*PasswordAuthentication.*/PasswordAuthentication yes/g /etc/ssh/sshd_config"
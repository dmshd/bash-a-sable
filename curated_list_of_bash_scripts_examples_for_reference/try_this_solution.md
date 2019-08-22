sudo -u hobo hobo-manage tenant_command runscript -d $1-hobo.$2 /opt/publik/scripts/build-e-guichet/hobo_create_variables.py  

check how is used the $1-hobo.$2 parameter   

try to duplicate hobo_create_variables.py with other variables and try to execute the script  

maybe just try to find the variables in the postgresql and change it by a request....  

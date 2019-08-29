`sudo -u hobo hobo-manage tenant_command runscript -d $1-hobo.$2 /opt/publik/scripts/build-e-guichet/hobo_create_variables.py`
est la commande qui set les variables hobo  

DONE idea- try to duplicate hobo_create_variables.py with other variables and try to execute the script    
DONE sudo -u hobo hobo-manage tenant_command runscript -d local-hobo.example.net /opt/publik/scripts/build-e-guichet/hobo_test_to_update_variables.py  
NOT WORKING

try to find the relative model from view settings/variables in hobo 


Not tried yet idea- maybe just try to find the variables in the postgresql and change it by a request....  



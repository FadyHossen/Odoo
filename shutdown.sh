# Get container id 

odoo_id=`docker ps -qf name=odoo-web-1`
db_id=`docker ps -qf name=odoo-mydb-1`

# copy files from  comtainer 
## db
docker cp $db_id:/var/lib/postgresql/data/pgdata /workspace/Odoo/db_data
## odoo_data
docker cp $odoo_id:/var/lib/odoo /workspace/Odoo/odoo_data
## addons
docker cp $odoo_id:/mnt/extra-addons /workspace/Odoo/addons_data

## zip folder 
zip -r db_data.zip /workspace/Odoo/db_data
zip -r odoo_data.zip /workspace/Odoo/odoo_data
zip -r addons_data.zip /workspace/Odoo/addons_data

# git add .
# git  commit  
# git push
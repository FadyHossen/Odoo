# unzip folder 
unzip zipfile -d extract_path
unzip /workspace/Odoo/odoo_data.zip -d /
unzip /workspace/Odoo/db_data.zip -d /


# Run docker compose
docker compose up


# get container id 
odoo_id=`docker ps -qf name=odoo-web-1`
db_id=`docker ps -qf name=odoo-mydb-1`

#Copy files from host to container 
docker cp /workspace/Odoo/odoo_data/odoo $odoo_id:/var/lib
docker cp /workspace/Odoo/db_data/pgdata $db_id:/var/lib/postgresql/data

/var/lib/odoo/filestore/newpack/2f/2f7028932480cdcb927f83b0165d577669e620f

# Shutdown docker containers
docker compose down


# Take backup
docker exec -t your-db-container pg_dumpall -c -U your-db-user > dump_$(date +%Y-%m-%d_%H_%M_%S).sql
docker exec -t $db_id pg_dumpall -c -U odoo > dump_$(date +%Y-%m-%d_%H_%M_%S).sql

docker cp $odoo_id:/var/lib/odoo /workspace/Odoo/odoo_data 
docker cp $db_id:/var/lib/postgresql/data/pgdata /workspace/Odoo/db_data

## zip folder 
 zip -r db_data.zip /workspace/Odoo/db_data
 zip -r odoo_data.zip /workspace/Odoo/odoo_data

# Restore backup

cat your_dump.sql | docker exec -i your-db-container psql -U your-db-user -d your-db-name

ex
 cat /workspace/Odoo/dump_2022-11-05_12_00_42.sql | docker exec -i $db_id psql -U odoo -d postgres


# Get database container id 
docker ps -f name=odoo-mydb-1 --quiet

# Get all containers info 
docker container ls 

# docker cp source_file_path container_id:<container path>


find /workspace/Odoo/db_data/pgdata -type d -exec chmod 777 {} \;